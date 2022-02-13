using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IProductTransactionRepository
    {
        Task<NidasShoesResultEntity<ProductTransactionEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdate(ProductTransactionEntity account);
        Task<NidasShoesResultEntity<ProductTransactionEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);

        Task<NidasShoesResultEntity<ProductTransactionEntity>> GetListDataByUserId(int UserId, BaseParamEntity baseParam);

    }
}
