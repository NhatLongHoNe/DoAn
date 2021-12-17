using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.IService
{
    public interface INCCService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(NCCModel slideModel);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);
    }
}
