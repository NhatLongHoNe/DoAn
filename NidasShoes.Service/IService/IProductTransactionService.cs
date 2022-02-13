using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IProductTransactionService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(ProductTransactionViewModel productCategory);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);

        Task<string> GetListDataByUserId(int UserId, BaseParamModel baseParam);

    }
}
