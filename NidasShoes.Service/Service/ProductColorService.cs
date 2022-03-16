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
    public class ProductColorService : IProductColorService
    {
        IProductColorRepository _productColorRepository;
        public ProductColorService(IProductColorRepository productColorRepository)
        {
            _productColorRepository = productColorRepository;
        }
        public async Task<string> AddOrUpdate(ColorModel productColorModel)
        {
            var productColorEntity = JsonConvert.DeserializeObject<ColorEntity>(JsonConvert.SerializeObject(productColorModel));
            var res = await _productColorRepository.AddOrUpdate(productColorEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _productColorRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _productColorRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _productColorRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
