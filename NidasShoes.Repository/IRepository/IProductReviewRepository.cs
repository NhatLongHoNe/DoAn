using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IProductReviewRepository
    {
        Task<NidasShoesResultEntity<ProductReviewEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdate(ProductReviewEntity productReviewEntity);
        Task<NidasShoesResultEntity<ProductReviewEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);

        //them
        Task<NidasShoesResultEntity<ProductReviewEntity>> GetListDataFavoriteByUserID(int UserID, BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<ProductReviewEntity>> GetRateingReviewByProductID(int id);
        Task<NidasShoesResultEntity<ProductReviewEntity>> GetByProductId(int Id);


    }
}
