using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface ISlideService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(SlideModel slideModel);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);
    }
}
