using ShopGame.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Repository.IRepository
{
    public interface IProductRepository
    {
        Task<ShopGameResultEntity<ProductCategoryEntity>> GetListData(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdate(ProductCategoryEntity account);
        Task<ShopGameResultEntity<ProductCategoryEntity>> GetById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteById(int Id);


        // product

        Task<ShopGameResultEntity<ProductEntity>> GetListDataProduct(BaseParamEntity baseParam);
        Task<ShopGameResultEntity<Boolean>> AddOrUpdateProduct(ProductEntity product,List<ProductImageEntity> productImages);
        Task<ShopGameResultEntity<ProductEntity>> GetProductById(int Id);
        Task<ShopGameResultEntity<Boolean>> DeleteProductById(int Id);
        Task<ShopGameResultEntity<ProductImageEntity>> GetProductImage(int Id);

        //client
        Task<ShopGameResultEntity<ProductEntity>> GetListDataProductByProductCategoryId(int productCategoryId, BaseParamEntity baseParam);


        // mua acc
        Task<ShopGameResultEntity<int>> BuyAccount(int productId,int userId);
        Task<ShopGameResultEntity<int>> BuySkin(int skinId,int userId, string name);
    }
}
