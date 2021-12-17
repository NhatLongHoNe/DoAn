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
    public class AuthenticationRepository : IAuthenticationRepository
    {
        ICommonRepository _commonRepository;
        public AuthenticationRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<ShopGameResultEntity<AccountEntity>> Login(AccountEntity account)
        {
            var param = new DynamicParameters();
            param.Add("@UserName", account.UserName);
            param.Add("@HashedPassword", account.HashedPassword);
            return await _commonRepository.ListProcedureAsync<AccountEntity>("shopgame_login", param);
        }
        public async Task<ShopGameResultEntity<AccountEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam",baseParam.ConvertObjectToDataTable(),System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<AccountEntity>("shopgame_get_account", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

        public async Task<ShopGameResultEntity<bool>> AddOrUpdate(AccountEntity account)
        {
            var param = new DynamicParameters();
            param.Add("@Id", account.Id);
            param.Add("@UserName", account.UserName);
            param.Add("@HashedPassword", account.HashedPassword);
            return await _commonRepository.ListProcedureAsync<bool>("shopgame_create_login", param);
        }

        public async Task<ShopGameResultEntity<AccountEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            return await _commonRepository.ListProcedureAsync<AccountEntity>("shopgame_get_login_byId", param);
        }

        public async Task<ShopGameResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            return await _commonRepository.ListProcedureAsync<bool>("shopgame_delete_login", param);
        }
    }
}
