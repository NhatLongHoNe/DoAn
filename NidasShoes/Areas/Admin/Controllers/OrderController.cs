using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using NidasShoes.Service.Model.ViewModel;
using Rotativa.AspNetCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp.Common;

namespace NidasShoes.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class OrderController : BaseController
    {
        IOrderService _OrderService;
        IProductService _ProductService;
        IDiscountService _DiscountService;
        public OrderController(IOrderService OrderService , IProductService productService, IDiscountService discountService)
        {
            _OrderService = OrderService;
            _ProductService = productService;
            _DiscountService = discountService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            BaseParamModel baseParamOrder = new BaseParamModel()
            {
                PageNumber = 1,
                PageSize = 20,
                Search = ""
            };
            var response = await _OrderService.GetListData(baseParam);
            ViewBag.orderStatus = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderStatusModel>>(await _OrderService.GetListDataStatus(baseParamOrder));
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _OrderService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new OrderModel()
                {
                    ID = 0,
                    Description = ""
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(OrderModel obj)
        {

            var response = await _OrderService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _OrderService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
        
        public async Task<IActionResult> GetOrderDetail(int orderId)
        {
            var response = await _OrderService.GetListDataOrderDetailByOrderId(orderId);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderDetailModel>>(response).Results;

            var listDataDetail = new List<ProductDetailClientModel>();
            double cost = 0;
            foreach (var item in result)
            {
                var json = await _ProductService.GetProductDetailClientByProductDetailId(item.ProductDetailID);
                var detail= JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailClientModel>>(json).Results;
                if (detail.Count > 0)
                {
                    var productDetail = detail.First();
                    productDetail.Quantity = item.Quantity;
                    productDetail.ExportPrice = item.Price;
                    listDataDetail.Add(productDetail);
                }
                cost += (double)(item.Price*item.Quantity); 
            }

            var order = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderModel>>(await _OrderService.GetById(orderId)).Results.First();

            if(order != null)
            {
                if (order.DiscountID > 0)
                {
                    var discount = JsonConvert.DeserializeObject<NidasShoesResultModel<DiscountModel>>(await _DiscountService.GetById(order.DiscountID)).Results.First();
                    ViewBag.discout = discount;
                }
            }
            ViewBag.Order = order;
            ViewBag.ListProductDetail = listDataDetail;
            ViewBag.Cost = cost;
            ViewBag.OrderDetail = result;
            return View();
        }
        
        public async Task<IActionResult> GetOrderDetailPrint(int orderId)
        {
            var response = await _OrderService.GetListDataOrderDetailByOrderId(orderId);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderDetailModel>>(response).Results;

            var listDataDetail = new List<ProductDetailClientModel>();
            double cost = 0;
            foreach (var item in result)
            {
                var json = await _ProductService.GetProductDetailClientByProductDetailId(item.ProductDetailID);
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

            var order = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderModel>>(await _OrderService.GetById(orderId)).Results.First();

            var discount = new DiscountModel();
            if (order != null)
            {
                if (order.DiscountID > 0)
                {
                    discount = JsonConvert.DeserializeObject<NidasShoesResultModel<DiscountModel>>(await _DiscountService.GetById(order.DiscountID)).Results.First();
                }
            }

            OrderToPfdViewModel model = new OrderToPfdViewModel()
            {
                ID = order.ID,
                CustomerID = order.CustomerID,
                EmployeeID = order.EmployeeID,
                PaymentID = order.PaymentID,
                DiscountID = order.DiscountID,
                CreatedDate = order.CreatedDate,
                Description = order.Description,
                Note = order.Note,
                OrderStatusID = order.OrderStatusID,
                CustomerName = order.CustomerName,
                CustomerMobile = order.CustomerMobile,
                CustomerEmail = order.CustomerEmail,
                CustomerAddress = order.CustomerAddress,
                OrderDetails = result,
                StatusName = order.StatusName,
                PaymentName = order.PaymentName,
                EmployeeName = order.EmployeeName,
                TotalCost = order.TotalCost,
                Cost = cost,
                ProductDetails = listDataDetail,
                Discount = discount
            };
            return new ViewAsPdf(model);
        }
        [HttpPost]
        public async Task<IActionResult> UpdateStatusOrder(int OrderId,int StatusId)
        {
            byte[] arr = new byte[0];

            if (HttpContext.Session.TryGetValue("User", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));
                var res = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(await _OrderService.UpdateStatusOrder(OrderId, StatusId, json.Id));
                if (res.Success)
                {
                    if(StatusId == 6)
                    {
                        var response = await _OrderService.GetListDataOrderDetailByOrderId(OrderId);
                        var result = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderDetailModel>>(response).Results;
                        foreach (var item in result)
                        {
                            await _ProductService.UpdateQuantityProductDetail(item.ProductDetailID, item.Quantity);
                        }
                    }
                    return Json(new
                    {
                        status = true
                    });
                }
            }
            return Json(new
            {
                status = false
            });
        }
    }
}
