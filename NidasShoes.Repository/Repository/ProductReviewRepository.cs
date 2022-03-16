using Dapper;
using NidasShoes.Repository.Common;
using NidasShoes.Repository.Entity;
using NidasShoes.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.Repository
{
    public class ProductReviewRepository : IProductReviewRepository
    {
        public ICommonRepository _commonRepository;
        public ProductReviewRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(ProductReviewEntity productReviewEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", productReviewEntity.ID);
            param.Add("@UserID", productReviewEntity.UserID);
            param.Add("@ProductID", productReviewEntity.ProductID);
            param.Add("@Star", productReviewEntity.Star);
            param.Add("@Favorite", productReviewEntity.Favorite);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_ProductReview", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_ProductReview", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ProductReviewEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ProductReviewEntity>("NidasShoes_get_ProductReview_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ProductReviewEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ProductReviewEntity>("NidasShoes_get_ProductReview", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

        public Task<NidasShoesResultEntity<ProductReviewEntity>> GetListDataFavoriteByUserID(int UserID, BaseParamEntity baseParam)
        {
            throw new NotImplementedException();
        }
        public async Task<NidasShoesResultEntity<ProductReviewEntity>> GetRateingReviewByProductID(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ProductReviewEntity>("NidasShoes_get_rateing_Review_by_ProductID", param);
            return result;
        }
        public async Task<NidasShoesResultEntity<ProductReviewEntity>> GetByProductId(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ProductReviewEntity>("NidasShoes_get_ProductReview_by_productID", param);
            return result;
        }
    }
}
