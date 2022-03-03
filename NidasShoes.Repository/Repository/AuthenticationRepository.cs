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
    public class AuthenticationRepository : IAuthenticationRepository
    {
        ICommonRepository _commonRepository;
        public AuthenticationRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<UserEntity>> Login(UserEntity account)
        {
            var param = new DynamicParameters();
            param.Add("@UserName", account.UserName);
            param.Add("@HashedPassword", account.HashedPassword);
            return await _commonRepository.ListProcedureAsync<UserEntity>("NidasShoes_user_login", param);
        }
        public async Task<NidasShoesResultEntity<UserEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam",baseParam.ConvertObjectToDataTable(),System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<UserEntity>("NidasShoes_get_user", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(UserEntity account)
        {
            var param = new DynamicParameters();
            param.Add("@Id", account.Id);
            param.Add("@RuleID", account.RuleID);
            param.Add("@UserName", account.UserName);
            param.Add("@HashedPassword", account.HashedPassword);
            param.Add("@Name", account.Name);
            param.Add("@Email", account.Email);
            param.Add("@Address", account.Address);
            param.Add("@Phone", account.PhoneNumber);
            return await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_login", param);
        }

        public async Task<NidasShoesResultEntity<UserEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            return await _commonRepository.ListProcedureAsync<UserEntity>("NidasShoes_get_user_login_byId", param);
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            return await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_user_login", param);
        }

        public Task<NidasShoesResultEntity<int>> ForgotPass(string Email, string Hashed)
        {
            throw new NotImplementedException();
        }
    }
}
