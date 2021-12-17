using ShopGame.Repository.Entity;
using ShopGame.Service.Model;
using ShopGame.Service.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.IService
{
    public interface IClientSlideService
    {
        Task<string> GetListSlide(BaseParamModel baseParam);
    }
}
