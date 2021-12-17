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
    public class NapTheTransactionRepository : INapTheTransactionRepository
    {
        ICommonRepository _commonRepository;
        public NapTheTransactionRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public Task<ShopGameResultEntity<bool>> AddOrUpdate(ChagringEntity account)
        {
            throw new NotImplementedException();
        }

        public Task<ShopGameResultEntity<bool>> DeleteById(int Id)
        {
            throw new NotImplementedException();
        }

        public Task<ShopGameResultEntity<ChagringEntity>> GetById(int Id)
        {
            throw new NotImplementedException();
        }

        public Task<ShopGameResultEntity<ChagringEntity>> GetListData(BaseParamEntity baseParam)
        {
            throw new NotImplementedException();
        }

        public async Task<ShopGameResultEntity<NapTheTransaction>> GetListDataByUserId(int UserId, BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@UserId", UserId, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<NapTheTransaction>("shopgame_get_NapTheTransaction_by_UserId", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
