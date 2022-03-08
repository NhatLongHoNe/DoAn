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
    public class FeedBackService : IFeedBackService
    {
        IFeedBackRepository _feedBackRepository;
        public FeedBackService(IFeedBackRepository feedBackRepository)
        {
            _feedBackRepository = feedBackRepository;
        }
        public async Task<string> AddOrUpdate(FeedBackModel feedBackModel)
        {
            var feedBackEntity = JsonConvert.DeserializeObject<FeedBackEntity>(JsonConvert.SerializeObject(feedBackModel));
            var res = await _feedBackRepository.AddOrUpdate(feedBackEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _feedBackRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _feedBackRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _feedBackRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
