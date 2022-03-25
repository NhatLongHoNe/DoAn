using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Controllers
{
    public class OrderController : Controller
    {
        private readonly IProductService _productService;
        private readonly IOrderService _orderService;
        public OrderController(IProductService productService
           , IOrderService orderService)
        {
            _productService = productService;
            _orderService = orderService;
        }
        //public IActionResult Index()
        //{
        //    return View();

        //}
        public async Task<IActionResult> Index(BaseParamModel baseParam)
        {
          
            byte[] arr = new byte[0];

            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));
                var response = await _orderService.GetByCustomerId(json.Id);
                var result = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderModel>>(response);
                return View(result);
            }
            return View();
        }
        public async Task<IActionResult> GetOrderDetail(int orderId)
        {
            var response = await _orderService.GetListDataOrderDetailByOrderId(orderId);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderDetailModel>>(response).Results;

            var listDataDetail = new List<ProductDetailClientModel>();
            double cost = 0;
            foreach (var item in result)
            {
                var json = await _productService.GetProductDetailClientByProductDetailId(item.ProductDetailID);
                var detail = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailClientModel>>(json).Results;
                if (detail.Count > 0)
                {
                    var productDetail = detail.First();
                    productDetail.Quantity = item.Quantity;
                    productDetail.ExportPrice = item.Price;
                    listDataDetail.Add(productDetail);
                }
                cost += (double)(item.Price * item.Quantity);
            }

            var order = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderModel>>(await _orderService.GetById(orderId)).Results.First();

            ViewBag.Order = order;

            ViewBag.ListProductDetail = listDataDetail;
            ViewBag.Cost = cost;
            ViewBag.OrderDetail = result;
            return View();
        }
    }
}
