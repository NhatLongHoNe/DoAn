using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface ISupplyService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(SupplyModel supplyModel);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);
    }
}
