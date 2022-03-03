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
        ISupplyRepository _nCCRepository;
        public SupplyService(ISupplyRepository nCCRepository)
        {
            _nCCRepository = nCCRepository;
        }
        public async Task<string> AddOrUpdate(SupplyModel nCCModel)
        {
            var nCCEntity = JsonConvert.DeserializeObject<SupplyEntity>(JsonConvert.SerializeObject(nCCModel));
            var res = await _nCCRepository.AddOrUpdate(nCCEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _nCCRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _nCCRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _nCCRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
