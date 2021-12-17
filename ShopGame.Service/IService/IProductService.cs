using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.IService
{
    public interface IProductService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(ProductCategoryModel productCategory);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);


        Task<string> GetListDataProduct(BaseParamModel baseParam);
        Task<string> AddOrUpdateProduct(ProductModel product,List<ProductImageModel> productImages);
        Task<string> GetByProductId(int Id);
        Task<string> DeleteProductById(int Id);
        Task<string> GetProductImage(int Id);

        Task<string> GetListDataProductByProductCategoryId(int productCategoryId ,BaseParamModel baseParam);

        Task<string> BuyAccount(int productId,int userId);
        Task<string> BuySkin(int skinId,int userId,string Name);
    }
}
