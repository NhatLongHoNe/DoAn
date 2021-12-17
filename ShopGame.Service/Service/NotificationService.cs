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
    public class NotificationService : INotificationService
    {
        INotificationRepository _notificationRepository;
        public NotificationService(INotificationRepository notificationRepository)
        {
            _notificationRepository = notificationRepository;
        }
        public async Task<string> AddOrUpdate(NotificationModel card)
        {
            var cardEntity = JsonConvert.DeserializeObject<NotificationEntity>(JsonConvert.SerializeObject(card));
            var res = await _notificationRepository.AddOrUpdate(cardEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _notificationRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetById(int Id)
        {
            var res = await _notificationRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _notificationRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
    }
}
