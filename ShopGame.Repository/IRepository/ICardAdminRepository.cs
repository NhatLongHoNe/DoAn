using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface ICardAdminRepository
    {
        Task<ShopGameResultEntity<CardAdminEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(CardAdminEntity cardAdmin);
        Task<ShopGameResultEntity<CardAdminEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);
    }
}
