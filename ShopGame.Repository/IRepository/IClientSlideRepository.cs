using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IClientSlideRepository
    {
        Task<ShopGameResultEntity<ClientSlideEntity>> GetListDataSlide(BaseParamEntity baseParam);
    }
}
