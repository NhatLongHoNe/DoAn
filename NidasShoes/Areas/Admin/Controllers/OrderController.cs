﻿using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NidasShoes.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class OrderController : Controller
    {
        IOrderService _OrderService;
        IProductService _ProductService;
        public OrderController(IOrderService OrderService , IProductService productService)
        {
            _OrderService = OrderService;
            _ProductService = productService;
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

            ViewBag.Order = order;

            ViewBag.ListProductDetail = listDataDetail;
            ViewBag.Cost = cost;
            ViewBag.OrderDetail = result;
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> GetOrderDetailPrint(int orderId)
        {
            var response = await _OrderService.GetListDataOrderDetailByOrderId(orderId);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderDetailModel>>(response).Results;

            var listDataDetail = new List<ProductDetailClientModel>();

            foreach (var item in result)
            {
                var detail = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailClientModel>>(await _ProductService.GetProductDetailById(item.ProductDetailID)).Results.First();
                listDataDetail.Add(detail);
            }

            return View(result);
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
