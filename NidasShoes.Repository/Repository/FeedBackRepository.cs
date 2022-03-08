using Dapper;
using NidasShoes.Repository.Common;
using NidasShoes.Repository.Entity;
using NidasShoes.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.Repository
{
    public class FeedBackRepository : IFeedBackRepository
    {
        public ICommonRepository _commonRepository;
        public FeedBackRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(FeedBackEntity feedBackEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", feedBackEntity.ID);
            param.Add("@UserID", feedBackEntity.UserID);
            param.Add("@Title", feedBackEntity.Title);
            param.Add("@Content", feedBackEntity.Content);
            param.Add("@ParentFBID", feedBackEntity.ParentFBID);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_FeedBack", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_FeedBack", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<FeedBackEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<FeedBackEntity>("NidasShoes_get_FeedBack_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<FeedBackEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<FeedBackEntity>("NidasShoes_get_FeedBack", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
