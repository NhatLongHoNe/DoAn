using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApp.Controllers
{
    public class TranLogController : Controller
    {
        IConfiguration _configuration;
        IProductTransactionService _productTransactionService;

        public TranLogController(IProductTransactionService productTransaction, IConfiguration configuration)
        {
            _productTransactionService = productTransaction;
            _configuration = configuration;
        }
        public async Task<IActionResult> Index(int? pageSize, int? pageNumber, string? search)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageSize = pageSize ?? 999,
                PageNumber = pageNumber ?? 1,
                Search = search ?? ""
            };
            byte[] arr = new byte[0];
            ViewBag.Search = search;

            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));

                var res = JsonConvert.DeserializeObject<ShopGameResultModel<ProductTransactionViewModel>>(await _productTransactionService.GetListDataByUserId(json.Id, baseParam));

                return View(res);
            }
            return RedirectToAction("Index", "Login");
        }
        public async Task<IActionResult> Acc(int? pageSize, int? pageNumber, string? search)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageSize = pageSize ?? 999,
                PageNumber = pageNumber ?? 1,
                Search = search ?? ""
            };
            byte[] arr = new byte[0];
            ViewBag.Search = search;
            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));

                var res = JsonConvert.DeserializeObject<ShopGameResultModel<ProductTransactionViewModel>>(await _productTransactionService.GetListDataByUserId(json.Id, baseParam));

                return View(res);
            }
            return RedirectToAction("Index", "Login");

        }
    }
}
