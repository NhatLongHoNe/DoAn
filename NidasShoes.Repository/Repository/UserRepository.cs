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
    public class UserRepository : IUserRepository
    {
        ICommonRepository _commonRepository;
        public UserRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<UserEntity>> Login(UserEntity user)
        {
            var param = new DynamicParameters();
            param.Add("@UserName", user.UserName);
            param.Add("@HashedPassword", user.HashedPassword);
            return await _commonRepository.ListProcedureAsync<UserEntity>("NidasShoes_client_user_login", param);
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

        public async Task<NidasShoesResultEntity<int>> AddOrUpdate(UserEntity user)
        {
            var param = new DynamicParameters();
            param.Add("@Id", user.Id);
            param.Add("@UserName", user.UserName);
            param.Add("@HashedPassword", user.HashedPassword);
            param.Add("@Name", user.Name);
            param.Add("@Email", user.Email);
            param.Add("@Phone", user.PhoneNumber);
            return await _commonRepository.ListProcedureAsync<int>("NidasShoes_create_or_update_client_login", param);
        }

        public async Task<NidasShoesResultEntity<UserEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            return await _commonRepository.ListProcedureAsync<UserEntity>("NidasShoes_get_client_user_login_byId", param);
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            return await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_client_user_login", param);
        }

        public async Task<NidasShoesResultEntity<int>> ForgotPass(string Email, string Hashed)
        {
            var param = new DynamicParameters();
            param.Add("@email", Email);
            param.Add("@newPass", Hashed);
            return await _commonRepository.ListProcedureAsync<int>("forgot_password", param);
        }
    }
}
