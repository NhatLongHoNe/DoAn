using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IProductTransactionRepository
    {
        Task<ShopGameResultEntity<ProductTransactionEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(ProductTransactionEntity account);
        Task<ShopGameResultEntity<ProductTransactionEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);

        Task<ShopGameResultEntity<ProductTransactionEntity>> GetListDataByUserId(int UserId, BaseParamEntity baseParam);

    }
}
