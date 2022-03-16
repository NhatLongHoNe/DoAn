﻿using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IProductService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(ProductCategoryModel productCategory);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);


        Task<string> GetListDataProduct(BaseParamModel baseParam);
        Task<string> AddOrUpdateProduct(ProductModel product,List<ImagesModel> productImages);
        Task<string> GetByProductId(int Id);
        Task<string> DeleteProductById(int Id);
        Task<string> GetProductImageByProductID(int Id);
        Task<string> GetProductSizeByProductID(int Id);
        Task<string> GetProductColorByProductID(int Id);

        Task<string> GetListDataProductByProductCategoryId(int productCategoryId ,BaseParamModel baseParam);

        Task<string> GetListDataClientProduct(BaseParamModel baseParam);
        Task<string> GetListDataProductByParentID(int parentID, BaseParamModel baseParam);
        Task<string> GetProductDetailClient(int productID, int sizeID, int colorID);

        

    }
}
