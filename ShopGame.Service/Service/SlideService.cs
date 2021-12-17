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
    public class SlideService : ISlideService
    {
        ISlideRepository _slideRepository;
        public SlideService(ISlideRepository slideRepository)
        {
            _slideRepository = slideRepository;
        }
        public async Task<string> AddOrUpdate(SlideModel slideModel)
        {
            var slideEntity = JsonConvert.DeserializeObject<SlideEntity>(JsonConvert.SerializeObject(slideModel));
            var res = await _slideRepository.AddOrUpdate(slideEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _slideRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _slideRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _slideRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
