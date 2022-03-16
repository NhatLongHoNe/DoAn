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
    public class ProductReviewService : IProductReviewService
    {
        IProductReviewRepository _productReviewRepository;
        public ProductReviewService(IProductReviewRepository productReviewRepository)
        {
            _productReviewRepository = productReviewRepository;
        }
        public async Task<string> AddOrUpdate(ProductReviewModel productReviewModel)
        {
            var productReviewEntity = JsonConvert.DeserializeObject<ProductReviewEntity>(JsonConvert.SerializeObject(productReviewModel));
            var res = await _productReviewRepository.AddOrUpdate(productReviewEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _productReviewRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _productReviewRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _productReviewRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }

        public Task<string> GetListDataFavoriteByUserId(int UserID, BaseParamModel baseParam)
        {
            throw new NotImplementedException();
        }
        public async Task<string> GetRateingReviewByProductID(int Id)
        {
            var res = await _productReviewRepository.GetRateingReviewByProductID(Id);
            return JsonConvert.SerializeObject(res);
        }
        public async Task<string> GetByProductId(int Id)
        {
            var res = await _productReviewRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }
    }
}
