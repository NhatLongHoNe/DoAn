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
    public class SlideRepository : ISlideRepository
    {
        public ICommonRepository _commonRepository;
        public SlideRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(SlideEntity slideEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", slideEntity.ID);
            param.Add("@Image", slideEntity.Image);
            param.Add("@DisplayOrder", slideEntity.DisplayOrder);
            param.Add("@Link", slideEntity.Link);
            param.Add("@Title", slideEntity.Title);
            param.Add("@Status", slideEntity.Status);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_Slide", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_Slide", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<SlideEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<SlideEntity>("NidasShoes_get_Slide_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<SlideEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<SlideEntity>("NidasShoes_get_Slide", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
