using Newtonsoft.Json;
using ShopGame.Repository.Entity;
using ShopGame.Repository.IRepository;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using ShopGame.Service.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.Service
{
    public class ClientSlideService : IClientSlideService
    {
        IClientSlideRepository _clientSlideRepository;
        public ClientSlideService(IClientSlideRepository clientSlideRepository)
        {
            _clientSlideRepository = clientSlideRepository;
        }


        public async Task<string> GetListSlide(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _clientSlideRepository.GetListDataSlide(baseEntity);
            return JsonConvert.SerializeObject(response);
        }
    }
}
