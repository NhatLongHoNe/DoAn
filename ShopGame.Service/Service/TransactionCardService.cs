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
    public class TransactionCardService : ITransactionCardService
    {
        ITransactionCardRepository _transactionCardRepository;
        public TransactionCardService(ITransactionCardRepository transactionCardRepository)
        {
            _transactionCardRepository = transactionCardRepository;
        }

        public async Task<string> Callback(TheSieuReReturnModel theSieuReReturn)
        {
            var entity = JsonConvert.DeserializeObject<TheSieuReReturnEntity>(JsonConvert.SerializeObject(theSieuReReturn));
            var res = await _transactionCardRepository.CallBack(entity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> Charge(ChagringModel chagringModel)
        {
            var entity = JsonConvert.DeserializeObject<ChagringEntity>(JsonConvert.SerializeObject(chagringModel));
            var res = await _transactionCardRepository.Charge(entity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
