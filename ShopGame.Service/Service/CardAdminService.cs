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
    public class CardAdminService : ICardAdminService
    {
        ICardAdminRepository _cardAdminRepository;
        public CardAdminService(ICardAdminRepository cardAdminRepository)
        {
            _cardAdminRepository = cardAdminRepository;
        }
        public async Task<string> AddOrUpdate(CardAdminModel card)
        {
            var cardEntity = JsonConvert.DeserializeObject<CardAdminEntity>(JsonConvert.SerializeObject(card));
            var res = await _cardAdminRepository.AddOrUpdate(cardEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _cardAdminRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _cardAdminRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _cardAdminRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
