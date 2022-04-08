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
    public class OrderRepository : IOrderRepository
    {
        ICommonRepository _commonRepository;
        public OrderRepository(ICommonRepository commonRepository)
        {
            _commonRepository = commonRepository;
        }

        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(OrderEntity order)
        {
            var param = new DynamicParameters();
            param.Add("@Id", order.ID);
            param.Add("@CustomerID", order.CustomerID);
            param.Add("@EmployeeID", order.EmployeeID);
            param.Add("@PaymentID", order.PaymentID);
            param.Add("@DiscountID", order.DiscountID);
            param.Add("@Description", order.Description);
            param.Add("@Note", order.Note);
            param.Add("@OrderStatusID", order.OrderStatusID);
            param.Add("@CustomerName", order.CustomerName);
            param.Add("@CustomerMobile", order.CustomerMobile);
            param.Add("@CustomerEmail", order.CustomerEmail);
            param.Add("@CustomerAddress", order.CustomerAddress);
            param.Add("@TotalCost", order.TotalCost);

            param.Add("@OrderDetail", order.orderDetails.ConvertListToDataTable(), System.Data.DbType.Object);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_create_or_update_Order", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> AddOrUpdate(OrderEntity order, OrderDetailEntity orderDetail)
        {
            throw new NotImplementedException();
        }

        public async Task<NidasShoesResultEntity<bool>> DeleteById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_delete_Order", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<OrderEntity>> GetById(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<OrderEntity>("NidasShoes_get_Order_byId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<OrderEntity>> GetListData(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<OrderEntity>("NidasShoes_get_Order", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

      

        public async Task<NidasShoesResultEntity<OrderStatusEntity>> GetListDataStatus(BaseParamEntity baseParam)
        {
            int Totals = 0, PageCount = 0;
            var param = new DynamicParameters();
            param.Add("@BaseParam", baseParam.ConvertObjectToDataTable(), System.Data.DbType.Object);
            param.Add("@Totals", Totals, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            param.Add("@PageCount", PageCount, System.Data.DbType.Int32, System.Data.ParameterDirection.InputOutput);
            var res = await _commonRepository.ListProcedureAsync<OrderStatusEntity>("NidasShoes_get_OrderStatus", param);
            res.TotalRecords = param.Get<int>("@Totals");
            res.PageCount = param.Get<int>("@PageCount");
            res.PageSize = baseParam.PageSize;
            res.PageNumber = baseParam.PageNumber;
            return res;
        }

        // order detail
        public async Task<NidasShoesResultEntity<OrderDetailEntity>> GetListDataOrderDetailByOrderId(int Id)
        {
            var param = new DynamicParameters();
            param.Add("@Id", Id);
            var result = await _commonRepository.ListProcedureAsync<OrderDetailEntity>("NidasShoes_get_OrderDetail_by_OrderId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<OrderEntity>> GetByCustomerId(int CustomerId)
        {
            var param = new DynamicParameters();
            param.Add("@Id", CustomerId);
            var result = await _commonRepository.ListProcedureAsync<OrderEntity>("NidasShoes_get_Order_by_CustomerId", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<bool>> UpdateStatusOrder(int OrderId, int StatusId, int EmployeeID)
        {
            var param = new DynamicParameters();
            param.Add("@Id", OrderId);
            param.Add("@StatusID", StatusId);
            param.Add("@EmployeeID", EmployeeID);
            var result = await _commonRepository.ListProcedureAsync<bool>("NidasShoes_Update_Status_Order_By_Id", param);
            return result;
        }

        public async Task<NidasShoesResultEntity<TransactionEntity>> GetListDataTransaction()
        {
            var result = await _commonRepository.ListProcedureAsync<TransactionEntity>("NidasShoes_transaction_export");
            return result;
        }
    }
}
