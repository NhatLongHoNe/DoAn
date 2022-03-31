using Newtonsoft.Json;
using NidasShoes.Repository.Entity;
using NidasShoes.Repository.IRepository;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.Service
{
    public class ProductService : IProductService
    {
        IProductRepository _productRepository;
        public ProductService(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }
        #region product category
        public async Task<string> AddOrUpdate(ProductCategoryModel productCategory)
        {
            var productCategoryEntity = JsonConvert.DeserializeObject<ProductCategoryEntity>(JsonConvert.SerializeObject(productCategory));
            var response = await _productRepository.AddOrUpdate(productCategoryEntity);
            return JsonConvert.SerializeObject(response);
        }
        public async Task<string> DeleteById(int Id)
        {
            var response = await _productRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(response);
        }
        public async Task<string> GetById(int Id)
        {
            var response = await _productRepository.GetById(Id);
            return JsonConvert.SerializeObject(response);
        }
        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _productRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(response);
        }
        #endregion

        #region product 
        public async Task<string> GetListDataProduct(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _productRepository.GetListDataProduct(baseEntity);
            return JsonConvert.SerializeObject(response);
        }

        public async Task<string> AddOrUpdateProduct(ProductModel product, List<ProductImageModel> productImages)
        {
            var productEntity = JsonConvert.DeserializeObject<ProductEntity>(JsonConvert.SerializeObject(product));
            var productImagesEntity = JsonConvert.DeserializeObject<List<ProductImageEntity>>(JsonConvert.SerializeObject(productImages));
            var response = await _productRepository.AddOrUpdateProduct(productEntity, productImagesEntity);
            return JsonConvert.SerializeObject(response);
        }

        public async Task<string> DeleteProductById(int Id)
        {
            var res = await _productRepository.DeleteProductById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetByProductId(int Id)
        {
            var res = await _productRepository.GetProductById(Id);
            return JsonConvert.SerializeObject(res);
        }
        #endregion

        #region product detail
        public async Task<string> AddOrUpdateProductDetail(ProductDetailModel productDetail)
        {
            var productDetailEntity = JsonConvert.DeserializeObject<ProductDetailEntity>(JsonConvert.SerializeObject(productDetail));
            var response = await _productRepository.AddOrUpdateProductDetail(productDetailEntity);
            return JsonConvert.SerializeObject(response);
        }
        public async Task<string> DeleteProductDetailById(int Id)
        {
            var response = await _productRepository.DeleteProductDetailById(Id);
            return JsonConvert.SerializeObject(response);
        }
        public async Task<string> GetProductDetailById(int Id)
        {
            var response = await _productRepository.GetProductDetailById(Id);
            return JsonConvert.SerializeObject(response);
        }
        public async Task<string> GetListDataProductDetail(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _productRepository.GetListDataProductDetail(baseEntity);
            return JsonConvert.SerializeObject(response);
        }
        #endregion

        #region product client
        public async Task<string> GetProductDetailClientByProductDetailId(int Id)
        {
            var response = await _productRepository.GetProductDetailClientByProductDetailId(Id);
            return JsonConvert.SerializeObject(response);
        }
        public async Task<string> GetProductImageByProductID(int Id)
        {
            var res = await _productRepository.GetProductImageByProductID(Id);
            return JsonConvert.SerializeObject(res);
        }
        public async Task<string> GetProductSizeByProductID(int Id)
        {
            var res = await _productRepository.GetProductSizeByProductID(Id);
            return JsonConvert.SerializeObject(res);
        }
        public async Task<string> GetProductColorByProductID(int Id)
        {
            var res = await _productRepository.GetProductColorByProductID(Id);
            return JsonConvert.SerializeObject(res);
        }
        public async Task<string> GetListDataProductByProductCategoryId(int productCategoryId, BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _productRepository.GetListDataProductByProductCategoryId(productCategoryId, baseEntity);
            return JsonConvert.SerializeObject(response);
        }

        public async Task<string> GetListDataClientProduct(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _productRepository.GetListDataClientProduct(baseEntity);
            return JsonConvert.SerializeObject(response);
        }

        public async Task<string> GetListDataProductByParentID(int parentID, BaseParamModel baseParam)
        {
            throw new NotImplementedException();
        }

        public async Task<string> GetProductDetailClient(int productID, int sizeID, int colorID)
        {
            var res = await _productRepository.GetProductDetailClient(productID, sizeID, colorID);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListProductClientBySearch(int productCategoryID, int sizeID, int colorID)
        {
            var res = await _productRepository.GetListProductClientBySearch(productCategoryID, sizeID, colorID);
            return JsonConvert.SerializeObject(res);
        }
        #endregion
    }
}
