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

        public async Task<string> GetProductImage(int Id)
        {
            var res = await _productRepository.GetProductImage(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListDataProductByProductCategoryId(int productCategoryId, BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _productRepository.GetListDataProductByProductCategoryId(productCategoryId,baseEntity);
            return JsonConvert.SerializeObject(response);
        }

        public async Task<string> BuyAccount(int productId, int userId)
        {
            var res = await _productRepository.BuyAccount(productId,userId);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> BuySkin(int skinId, int userId,string Name)
        {
            var res = await _productRepository.BuySkin(skinId, userId,Name);
            return JsonConvert.SerializeObject(res);
        }
    }
}
