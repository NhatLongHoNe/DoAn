using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IStepRepository
    {
        Task<ShopGameResultEntity<StepEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(StepEntity step);
        Task<ShopGameResultEntity<StepEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);

    }
}
