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
    public class ProductSizeService : IProductSizeService
    {
        IProductSizeRepository _productSizeRepository;
        public ProductSizeService(IProductSizeRepository productSizeRepository)
        {
            _productSizeRepository = productSizeRepository;
        }
        public async Task<string> AddOrUpdate(SizeModel productSizeModel)
        {
            var productSizeEntity = JsonConvert.DeserializeObject<SizeEntity>(JsonConvert.SerializeObject(productSizeModel));
            var res = await _productSizeRepository.AddOrUpdate(productSizeEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _productSizeRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _productSizeRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _productSizeRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
