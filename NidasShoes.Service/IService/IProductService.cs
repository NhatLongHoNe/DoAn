using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IProductService
    {
        // product category
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(ProductCategoryModel productCategory);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);

        //product
        Task<string> GetListDataProduct(BaseParamModel baseParam);
        Task<string> AddOrUpdateProduct(ProductModel product,List<ProductImageModel> productImages);
        Task<string> GetByProductId(int Id);
        Task<string> DeleteProductById(int Id);
        Task<string> GetProductImageByProductID(int Id);
        Task<string> GetProductSizeByProductID(int Id);
        Task<string> GetProductColorByProductID(int Id);
        Task<string> GetListDataProductByProductCategoryId(int productCategoryId ,BaseParamModel baseParam);

        //product detail
        Task<string> GetProductDetailClientByProductDetailId(int Id);

        Task<string> GetListDataProductDetail(BaseParamModel baseParam);
        Task<string> AddOrUpdateProductDetail(ProductDetailModel productDetail);
        Task<string> GetProductDetailById(int Id);
        Task<string> DeleteProductDetailById(int Id);


        //product client
        Task<string> GetListDataClientProduct(BaseParamModel baseParam);
        Task<string> GetListDataProductByParentID(int parentID, BaseParamModel baseParam);
        Task<string> GetProductDetailClient(int productID, int sizeID, int colorID);

        //product client
        Task<string> GetListProductClientBySearch(int productCategoryID, int sizeID, int colorID);



    }
}
