using NidasShoes.Repository.Entity;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IClientSlideService
    {
        Task<string> GetListSlide(BaseParamModel baseParam);
    }
}
