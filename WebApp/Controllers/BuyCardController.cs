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

    public class BuyCardController : Controller
    {
        ITransactionCardService _transactionCardService;
        IConfiguration _configuration;
        INapTheTransactionService _napTheTransactionService;
        public BuyCardController(ITransactionCardService transactionCardService, IConfiguration configuration, INapTheTransactionService napTheTransactionService)
        {
            _transactionCardService = transactionCardService;
            _configuration = configuration;
            _napTheTransactionService = napTheTransactionService;
        }
        public async Task<IActionResult> Index()
        {
            return View();
        }
        public async Task<IActionResult>  Log(int? pageSize, int? pageNumber, string? search)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageSize = pageSize ?? 999,
                PageNumber = pageNumber ?? 1,
                Search = search ?? ""
            };
            byte[] arr = new byte[0];

            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));
                ViewBag.User = json;
                ViewBag.ListData = JsonConvert.DeserializeObject<ShopGameResultModel<NapTheTransactionModel>>(await _napTheTransactionService.GetListDataByUserId(json.Id, baseParam)).Results;
                return View(json);
            }
            return RedirectToAction("Index", "Login");
        }
    }
}
