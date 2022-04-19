using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Common;

namespace WebApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : BaseController
    {
        IAuthenticationService _authenticationService;
        IConfiguration _configuration;
        IOrderService _orderService;
        IReceiptService _receiptService;
        public HomeController(IConfiguration configuration
            , IAuthenticationService authenticationService
            ,IOrderService orderService
            , IReceiptService receiptService
            )
        {
            _authenticationService = authenticationService;
            _configuration = configuration;
            _orderService = orderService;
            _receiptService = receiptService;
        }
        [HttpGet]
        public async Task<IActionResult> Index()
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageNumber = 1,
                PageSize = 100000000,
                Search = "",
            };
            var dataOrder = JsonConvert.DeserializeObject<NidasShoesResultModel<OrderModel>>(await _orderService.GetListData(baseParam)).Results;
            var dataRecipt = JsonConvert.DeserializeObject<NidasShoesResultModel<ReceiptDetailModel>>(await _receiptService.GetListDataReceiptDetail(baseParam)).Results;

            var dataTransaction = JsonConvert.DeserializeObject<NidasShoesResultModel<TransactionModel>>(await _orderService.GetListDataTransaction()).Results;

            var demo = dataTransaction.Select(x => x.Year).Distinct().ToList();
            ViewBag.LstYear = dataTransaction.Select(x => x.Year).Distinct().ToList();
            ViewBag.CountOrderNew = dataOrder.Where(x=>x.OrderStatusID==1).Count();
            ViewBag.CountOrder = dataOrder.Where(x=>x.OrderStatusID!=6).Count();
            ViewBag.TotalOrderPrice = dataOrder.Where(x=>x.OrderStatusID!=1&& x.OrderStatusID != 6).Sum(x => x.TotalCost);
            ViewBag.TotalReciptPrice = dataRecipt.Sum(x => x.ImportPrice * x.ImportQuantity);

            return View();
        }
        [HttpGet]
        public async Task<IActionResult> GetDataTransaction(int year)
        {
            var data = JsonConvert.DeserializeObject<NidasShoesResultModel<TransactionModel>>(await _orderService.GetListDataTransaction()).Results;
            
            return Json(data.Where(x => x.Year == year).ToList());
        }
    }
}
