using Newtonsoft.Json;
using NidasShoes.Repository.Entity;
using NidasShoes.Repository.IRepository;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System.Threading.Tasks;

namespace NidasShoes.Service.Service
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
