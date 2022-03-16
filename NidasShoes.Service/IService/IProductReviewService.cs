using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IProductReviewService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(ProductReviewModel productReviewModel);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);

        Task<string> GetListDataFavoriteByUserId(int UserID, BaseParamModel baseParam);
        Task<string> GetRateingReviewByProductID(int ID);
        Task<string> GetByProductId(int Id);

    }
}
