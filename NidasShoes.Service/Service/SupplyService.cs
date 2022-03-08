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
    public class SupplyService : ISupplyService
    {
        ISupplyRepository _supplyRepository;
        public SupplyService(ISupplyRepository supplyRepository)
        {
            _supplyRepository = supplyRepository;
        }
        public async Task<string> AddOrUpdate(SupplyModel supplyModel)
        {
            var supplyEntity = JsonConvert.DeserializeObject<SupplyEntity>(JsonConvert.SerializeObject(supplyModel));
            var res = await _supplyRepository.AddOrUpdate(supplyEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _supplyRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _supplyRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _supplyRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
