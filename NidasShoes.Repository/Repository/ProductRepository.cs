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
    public class ProductRepository : IProductRepository
    {
        ICommonRepository _commonRepository;
        public ProductRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        #region Product Category
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(ProductCategoryEntity productCategoryEntity)
        {
            var param = new DynamicParameters();
            param.Add("@Id", productCategoryEntity.ID);
            param.Add("@ParentID", productCategoryEntity.ParentID);
            param.Add("@Name", productCategoryEntity.Name);
            param.Add("@Description", productCategoryEntity.Description);
            param.Add("@Status", productCategoryEntity.Status);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_ProductCategory", param);
            return result;
        }



        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_ProductCategory", param);
            return result;
        }



        public async Task<NidasShoesResultEntity<ProductCategoryEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ProductCategoryEntity>("NidasShoes_get_ProductCategory_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ProductCategoryEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ProductCategoryEntity>("NidasShoes_get_ProductCategory", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
        #endregion

        #region Product
        public async Task<NidasShoesResultEntity<ProductEntity>> GetListDataProduct(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ProductEntity>("NidasShoes_get_product", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

        public async Task<NidasShoesResultEntity<ProductEntity>> GetProductById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ProductEntity>("NidasShoes_get_Product_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> AddOrUpdateProduct(ProductEntity product, List<ProductImageEntity> productImages)
        {
            var param = new DynamicParameters();
            param.Add("@Id", product.ID);
            param.Add("@Code", product.Code);
            param.Add("@Name", product.Name);
            //param.Add("@Image", product.);
            //param.Add("@Description", product.Description);
            //param.Add("@Detail", product.Detail);
            //param.Add("@CategoryId", product.CategoryId);
            //param.Add("@OrderNo", product.OrderNo);
            //param.Add("@Rank", product.Rank);
            //param.Add("@SoTuong", product.SoTuong);
            //param.Add("@SoTrangPhuc", product.SoTrangPhuc);
            //param.Add("@LoaiTaiKhoan", product.LoaiTaiKhoan);
            //param.Add("@NoiBat", product.NoiBat);
            //param.Add("@DangKy", product.DangKy);
            //param.Add("@VIP", product.VIP);
            //param.Add("@Top", product.Top);
            //param.Add("@AccUserName", product.AccUserName);
            //param.Add("@AccPassword", product.AccPassword);
            //param.Add("@MetaTitle", product.MetaTitle);
            //param.Add("@MetaDescription", product.MetaDescription);
            //param.Add("@Status", product.Status);
            //param.Add("@Price", product.Price);
            param.Add("@ProductImage", productImages.ConvertListToDataTable(), System.Data.DbType.Object);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_product", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteProductById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_product", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ProductImageEntity>> GetProductImageByProductID(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ProductImageEntity>("NidasShoes_get_productImage_by_ProductID", param);
            return result;
        }
        public async Task<NidasShoesResultEntity<SizeEntity>> GetProductSizeByProductID(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<SizeEntity>("NidasShoes_get_productSize_by_ProductID", param);
            return result;
        }
        public async Task<NidasShoesResultEntity<ColorEntity>> GetProductColorByProductID(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ColorEntity>("NidasShoes_get_productColor_by_ProductID", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ProductEntity>> GetListDataProductByProductCategoryId(int productCategoryId, BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@ProductCategoryId", productCategoryId, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ProductEntity>("NidasShoes_get_list_product_byProductCategoryId", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
        #endregion

        #region Product client
        public async Task<NidasShoesResultEntity<ProductEntity>> GetListDataClientProduct(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ProductEntity>("NidasShoes_get_client_Product", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

        public Task<NidasShoesResultEntity<ProductEntity>> GetListDataProductByParentID(int parentID, BaseParamEntity baseParam)
        {
            throw new NotImplementedException();
        }

        public async Task<NidasShoesResultEntity<ProductDetailClientEntity>> GetProductDetailClient(int productID, int sizeID, int colorID)
        {
            var param = new DynamicParameters();
            param.Add("@Id", productID);
            param.Add("@sizeID", sizeID);
            param.Add("@colorID", colorID);
            var result = await _commonRepository.ListProcedureAsync<ProductDetailClientEntity>("NidasShoes_get_Client_Product_Detail", param);
            return result;
        }
        #endregion
    }
}
