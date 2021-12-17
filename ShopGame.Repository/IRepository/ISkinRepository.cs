using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface ISkinRepository
    {
        Task<ShopGameResultEntity<SkinEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(SkinEntity skin);
        Task<ShopGameResultEntity<SkinEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);

        Task<ShopGameResultEntity<SkinEntity>> GetListDataSkinBySkinCategoryId(int skinCategoryId, BaseParamEntity baseParam);

    }
}
