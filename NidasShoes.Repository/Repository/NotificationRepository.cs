using Dapper;
using NidasShoes.Repository.Common;
using NidasShoes.Repository.Entity;
using NidasShoes.Repository.IRepository;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.Repository
{
    public class NotificationRepository : INotificationRepository
    {
        public ICommonRepository _commonRepository;
        public NotificationRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }
        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(NotificationEntity notification)
        {
            var param = new DynamicParameters();
            param.Add("@Id", notification.Id);
            param.Add("@Content", notification.Content);
            param.Add("@Image", notification.Image);
            param.Add("@Status", notification.Status);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_notification", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_notification", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<NotificationEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<NotificationEntity>("NidasShoes_get_notification_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<NotificationEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<NotificationEntity>("NidasShoes_get_notification", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }
    }
}
