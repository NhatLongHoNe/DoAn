using Newtonsoft.Json;
using NidasShoes.Repository.Entity;
using NidasShoes.Repository.IRepository;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Service.Service
{
    public class OrderService : IOrderService
    {
        IOrderRepository _orderRepository;
        public OrderService(IOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }
        public async Task<string> AddOrUpdate(OrderModel orderModel)
        {
            var orderEntity = JsonConvert.DeserializeObject<OrderEntity>(JsonConvert.SerializeObject(orderModel));
            var res = await _orderRepository.AddOrUpdate(orderEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> DeleteById(int Id)
        {
            var res = await _orderRepository.DeleteById(Id);
            return JsonConvert.SerializeObject(res);
        }

     

        public async Task<string> GetById(int Id)
        {
            var res = await _orderRepository.GetById(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListData(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _orderRepository.GetListData(baseEntity);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListDataOrderDetailByOrderId(int Id)
        {
            var res = await _orderRepository.GetListDataOrderDetailByOrderId(Id);
            return JsonConvert.SerializeObject(res);
        }

        public async Task<string> GetListDataStatus(BaseParamModel baseParam)
        {
            var baseEntity = JsonConvert.DeserializeObject<BaseParamEntity>(JsonConvert.SerializeObject(baseParam));
            var res = await _orderRepository.GetListDataStatus(baseEntity);
            return JsonConvert.SerializeObject(res);
        }
        public async Task<string> GetByCustomerId(int CustomerId)
        {
            var res = await _orderRepository.GetByCustomerId(CustomerId);
            return JsonConvert.SerializeObject(res);
        }
        public async Task<string> UpdateStatusOrder(int OrderId, int StatusId, int EmployeeID)
        {
            var res = await _orderRepository.UpdateStatusOrder(OrderId, StatusId, EmployeeID);
            return JsonConvert.SerializeObject(res);
        }
    }
}
