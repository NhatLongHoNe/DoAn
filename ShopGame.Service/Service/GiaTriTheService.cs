using Newtonsoft.Json;
using ShopGame.Repository.Entity;
using ShopGame.Repository.IRepository;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.Service
{
    public class GiaTriTheService : IGiaTriTheService
    {
        IGiaTriTheRepository _giaTriTheRepository;
        public GiaTriTheService(IGiaTriTheRepository giaTriTheRepository)
        {
            _giaTriTheRepository = giaTriTheRepository;
        }
        public async Task<string> AddOrUpdate(GiaTriTheModel giaTriTheModel)
        {
            var giaTriTheEntity = JsonConvert.DeserializeObject<GiaTriTheEntity>(JsonConvert.SerializeObject(giaTriTheModel));
            var res = await _giaTriTheRepository.AddOrUpdate(giaTriTheEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _giaTriTheRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _giaTriTheRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _giaTriTheRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
