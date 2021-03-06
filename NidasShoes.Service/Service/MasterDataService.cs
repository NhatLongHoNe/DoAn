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
    public class MasterDataService : IMasterDataService
    {
        IMasterDataRepository _masterDataRepository;
        public MasterDataService(IMasterDataRepository masterDataRepository)
        {
            _masterDataRepository = masterDataRepository;
        }
        public async Task<string> AddOrUpdate(MasterDataModel masterDataModel)
        {
            var masterDataEntity = JsonConvert.DeserializeObject<MasterDataEntity>(JsonConvert.SerializeObject(masterDataModel));
            var res = await _masterDataRepository.AddOrUpdate(masterDataEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _masterDataRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _masterDataRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _masterDataRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
