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
    public class NapTheTransactionService : INapTheTransactionService
    {
        INapTheTransactionRepository _napTheTransactionRepository;
        public NapTheTransactionService(INapTheTransactionRepository napTheTransactionRepository)
        {
            _napTheTransactionRepository = napTheTransactionRepository;
        }
        public async Task<string> GetListDataByUserId(int UserId, BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var response = await _napTheTransactionRepository.GetListDataByUserId(UserId, baseEntity);
            return JsonConvert.SerializeObject(response);
        }
    }
}
