using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ShopGame.Service.IService
{
    public interface INotificationService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(NotificationModel notification);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);
    }
}
