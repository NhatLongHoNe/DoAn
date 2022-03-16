using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IProductColorService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(ColorModel colorModel);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);
    }
}
