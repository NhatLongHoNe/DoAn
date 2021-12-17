using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IMasterDataRepository
    {
        Task<ShopGameResultEntity<MasterDataEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(MasterDataEntity masterDataEntity);
        Task<ShopGameResultEntity<MasterDataEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);
    }
}
