using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IUserService
    {
        Task<string> Login(UserModel account);
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(UserModel account);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);
        Task<string> ForgotPassword(string Email,string Hashed);
    }
}
