using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.IService
{
    public interface IOrderService
    {
        Task<string> GetListData(BaseParamModel baseParam);
        Task<string> AddOrUpdate(OrderModel orderModel);
        Task<string> GetById(int Id);
        Task<string> DeleteById(int Id);

        Task<string> GetListDataStatus(BaseParamModel baseParam);

        Task<string> GetListDataOrderDetailByOrderId(int Id);

        Task<string> GetByCustomerId(int CustomerId);
        Task<string> UpdateStatusOrder(int OrderId, int StatusId, int EmployeeID);

        Task<string> GetListDataTransaction();

        

    }
}
