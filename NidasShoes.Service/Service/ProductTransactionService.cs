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
    public class ProductTransactionService : IProductTransactionService
    {
        IProductTransactionRepository _productTransactionRepository;
        public ProductTransactionService(IProductTransactionRepository productTransactionRepository)
        {
            _productTransactionRepository = productTransactionRepository;
        }

        public async Task<string> AddOrUpdate(ProductTransactionViewModel productCategory)
        {
            var productTransactionEntity = JsonConvert.DeserializeObject<ProductTransactionEntity>(JsonConvert.SerializeObject(productCategory));
            var res = await _productTransactionRepository.AddOrUpdate(productTransactionEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _productTransactionRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _productTransactionRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _productTransactionRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListDataByUserId(int UserId, BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _productTransactionRepository.GetListDataByUserId(UserId, baseEntity);
            return JsonConvert.SerializeObject(response);
        }
    }
}
