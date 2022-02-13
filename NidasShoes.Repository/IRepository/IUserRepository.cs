using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IUserRepository
    {
        Task<NidasShoesResultEntity<UserEntity>> Login(UserEntity account);
        Task<NidasShoesResultEntity<UserEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<int>> AddOrUpdate(UserEntity account);
        Task<NidasShoesResultEntity<UserEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);
        Task<NidasShoesResultEntity<int>> ForgotPass(string Email,string Hashed);
    }
}
