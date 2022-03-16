using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IProductRepository
    {
        // product category
        Task<NidasShoesResultEntity<ProductCategoryEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdate(ProductCategoryEntity account);
        Task<NidasShoesResultEntity<ProductCategoryEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);


        // product

        Task<NidasShoesResultEntity<ProductEntity>> GetListDataProduct(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdateProduct(ProductEntity product,List<ImagesEntity> productImages);
        Task<NidasShoesResultEntity<ProductEntity>> GetProductById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteProductById(int Id);
        Task<NidasShoesResultEntity<ImagesEntity>> GetProductImageByProductID(int Id);
        Task<NidasShoesResultEntity<SizeEntity>> GetProductSizeByProductID(int Id);
        Task<NidasShoesResultEntity<ColorEntity>> GetProductColorByProductID(int Id);

        //client
        Task<NidasShoesResultEntity<ProductEntity>> GetListDataProductByProductCategoryId(int productCategoryId, BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<ProductEntity>> GetListDataClientProduct(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<ProductEntity>> GetListDataProductByParentID(int parentID, BaseParamEntity baseParam);

        Task<NidasShoesResultEntity<ProductDetailClientEntity>> GetProductDetailClient(int productID, int sizeID, int colorID);

    }
}
