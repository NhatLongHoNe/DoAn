using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IUserRepository
    {
        Task<ShopGameResultEntity<UserEntity>> Login(UserEntity account);
        Task<ShopGameResultEntity<UserEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<int>> AddOrUpdate(UserEntity account);
        Task<ShopGameResultEntity<UserEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);
        Task<ShopGameResultEntity<int>> ForgotPass(string Email,string Hashed);
    }
}
