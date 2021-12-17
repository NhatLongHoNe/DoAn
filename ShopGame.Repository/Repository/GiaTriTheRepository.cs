using Dapper;
using ShopGame.Repository.Common;
using ShopGame.Repository.Entity;
using ShopGame.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.Repository
{
    public class GiaTriTheRepository : IGiaTriTheRepository
    {
        public ICommonRepository _commonRepository;
        public GiaTriTheRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<ShopGameResultEntity<bool>> AddOrUpdate(GiaTriTheEntity giaTriTheEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", giaTriTheEntity.Id);
            param.Add("@Name", giaTriTheEntity.Name);
            param.Add("@Value", giaTriTheEntity.Value);
            param.Add("@Percent", giaTriTheEntity.Percent);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_create_or_update_GiaTriThe", param);
            return result;
        }

        public async Task<ShopGameResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("shopgame_delete_GiaTriThe", param);
            return result;
        }

        public async Task<ShopGameResultEntity<GiaTriTheEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<GiaTriTheEntity>("shopgame_get_GiaTriThe_byId", param);
            return result;
        }

        public async Task<ShopGameResultEntity<GiaTriTheEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<GiaTriTheEntity>("shopgame_get_GiaTriThe", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
