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
    public class TransactionTypeService : ITransactionTypeService
    {
        ITransactionTypeRepository _TransactionTypeRepository;
        public TransactionTypeService(ITransactionTypeRepository TransactionTypeRepository)
        {
            _TransactionTypeRepository = TransactionTypeRepository;
        }
        public async Task<string> AddOrUpdate(TransactionTypeModel TransactionType)
        {
            var blogTypeEntity = JsonConvert.DeserializeObject<TransactionTypeEntity>(JsonConvert.SerializeObject(TransactionType));
            var res = await _TransactionTypeRepository.AddOrUpdate(blogTypeEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _TransactionTypeRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _TransactionTypeRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseParamEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _TransactionTypeRepository.GetListData(baseParamEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
