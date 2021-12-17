using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.IService
{
    public interface INapTheTransactionService
    {
        //Task<string> GetListData(BaseParamModel baseParam);
        //Task<string> AddOrUpdate(ProductCategoryModel productCategory);
        //Task<string> GetById(int Id);
        //Task<string> DeleteById(int Id);

        Task<string> GetListDataByUserId(int UserId, BaseParamModel baseParam);
    }
}
