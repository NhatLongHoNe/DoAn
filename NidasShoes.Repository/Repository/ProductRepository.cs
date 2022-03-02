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
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(ProductCategoryEntity account)
        {
            var param = new DynamicParameters();
            param.Add("@Id", account.ID);
            param.Add("@Name", account.Name);
            param.Add("@Description", account.Description);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_productcategory", param);
            return result;
        }



        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_productcategory", param);
            return result;
        }



        public async Task<NidasShoesResultEntity<ProductCategoryEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ProductCategoryEntity>("NidasShoes_getbyid_productcategory", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<ProductCategoryEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<ProductCategoryEntity>("NidasShoes_get_productcategory", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

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
            var result = await _commonRepository.ListProcedureAsync<ProductEntity>("NidasShoes_getbyId_product", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> AddOrUpdateProduct(ProductEntity product, List<ImagesEntity> productImages)
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

        public async Task<NidasShoesResultEntity<ImagesEntity>> GetProductImage(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<ImagesEntity>("NidasShoes_get_productImage", param);
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

        public async Task<NidasShoesResultEntity<int>> BuyAccount(int productId, int userId)
        {
            var param = new DynamicParameters();
            param.Add("@Id", productId);
            param.Add("@UserId", userId);
            var result = await _commonRepository.ListProcedureAsync<int>("NidasShoes_buy_account", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<int>> BuySkin(int skinId, int userId,string name)
        {
            var param = new DynamicParameters();
            param.Add("@Id", skinId);
            param.Add("@UserId", userId);
            param.Add("@Name", name);
            var result = await _commonRepository.ListProcedureAsync<int>("NidasShoes_buy_skin", param);
            return result;
        }
    }
}
