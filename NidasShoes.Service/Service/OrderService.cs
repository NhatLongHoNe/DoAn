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
    }
}
