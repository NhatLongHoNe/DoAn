using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IAuthenticationRepository
    {
        Task<ShopGameResultEntity<AccountEntity>> Login(AccountEntity account);
        Task<ShopGameResultEntity<AccountEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(AccountEntity account);
        Task<ShopGameResultEntity<AccountEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);
    }
}
