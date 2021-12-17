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
    public class StepService : IStepService
    {
        IStepRepository _stepRepository;
        public StepService(IStepRepository stepRepository)
        {
            _stepRepository = stepRepository;
        }

        public async Task<string> AddOrUpdate(StepModel slideModel)
        {
            var stepEntity = JsonConvert.DeserializeObject<StepEntity>(JsonConvert.SerializeObject(slideModel));
            var res = await _stepRepository.AddOrUpdate(stepEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _stepRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _stepRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _stepRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
