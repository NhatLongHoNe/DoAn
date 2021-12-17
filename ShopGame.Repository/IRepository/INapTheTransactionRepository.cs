using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface INapTheTransactionRepository
    {
        Task<ShopGameResultEntity<ChagringEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(ChagringEntity account);
        Task<ShopGameResultEntity<ChagringEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);

        Task<ShopGameResultEntity<NapTheTransaction>> GetListDataByUserId(int UserId, BaseParamEntity baseParam);
    }
}
