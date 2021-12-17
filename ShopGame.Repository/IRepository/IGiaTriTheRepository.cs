using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IGiaTriTheRepository
    {
        Task<ShopGameResultEntity<GiaTriTheEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(GiaTriTheEntity slide);
        Task<ShopGameResultEntity<GiaTriTheEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);
    }
}
