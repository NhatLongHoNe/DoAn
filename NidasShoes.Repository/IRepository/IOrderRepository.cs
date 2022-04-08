using NidasShoes.Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Repository.IRepository
{
    public interface IOrderRepository
    {
        Task<NidasShoesResultEntity<OrderEntity>> GetListData(BaseParamEntity baseParam);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdate(OrderEntity order);
        Task<NidasShoesResultEntity<Boolean>> AddOrUpdate(OrderEntity order,OrderDetailEntity orderDetail);
        Task<NidasShoesResultEntity<OrderEntity>> GetById(int Id);
        Task<NidasShoesResultEntity<Boolean>> DeleteById(int Id);

        Task<NidasShoesResultEntity<OrderEntity>> GetByCustomerId(int Id);
        Task<NidasShoesResultEntity<Boolean>> UpdateStatusOrder(int OrderId, int StatusId, int EmployeeID);

        // order status
        Task<NidasShoesResultEntity<OrderStatusEntity>> GetListDataStatus(BaseParamEntity baseParam);

        //order Detail
        Task<NidasShoesResultEntity<OrderDetailEntity>> GetListDataOrderDetailByOrderId(int Id);


        // Transaction
        Task<NidasShoesResultEntity<TransactionEntity>> GetListDataTransaction();


    }
}
