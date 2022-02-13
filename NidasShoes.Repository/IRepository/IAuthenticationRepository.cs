using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IAuthenticationRepository
    {
        Task<NidasShoesResultEntity<AccountEntity>> Login(AccountEntity account);
        Task<NidasShoesResultEntity<AccountEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdate(AccountEntity account);
        Task<NidasShoesResultEntity<AccountEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);
    }
}
