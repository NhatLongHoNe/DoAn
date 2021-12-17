using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Security.Cryptography.Xml;
using System.Text;
using System.Threading.Tasks;

namespace WebApp.Controllers
{
    public class NapTheController : Controller
    {
        ITransactionCardService _transactionCardService;
        IConfiguration _configuration;
        INapTheTransactionService _napTheTransactionService;
        static string url = "https://thesieure.com/chargingws/v2";

        public NapTheController(ITransactionCardService transactionCardService, IConfiguration configuration, INapTheTransactionService napTheTransactionService)
        {
            _transactionCardService = transactionCardService;
            _configuration = configuration;
            _napTheTransactionService = napTheTransactionService;
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

            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));
                ViewBag.User = json;
                ViewBag.ListData = JsonConvert.DeserializeObject<ShopGameResultModel<NapTheTransactionModel>>(await _napTheTransactionService.GetListDataByUserId(json.Id, baseParam)).Results;
                return View(json);
            }
            return RedirectToAction("Index", "Login");
        }
        public async Task<IActionResult> DepositHistory(int? pageSize, int? pageNumber, string? search)
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
                ViewBag.Search = search;
                ViewBag.ListData = JsonConvert.DeserializeObject<ShopGameResultModel<NapTheTransactionModel>>(await _napTheTransactionService.GetListDataByUserId(json.Id, baseParam)).Results;
                return View(json);
            }
            return RedirectToAction("Index", "Login");
        }

        [HttpPost]
        public async Task<IActionResult> Charge(ChagringModel chagring)
        {
            byte[] arr = new byte[0];
            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));
                chagring.UserId = json.Id;
                var res = JsonConvert.DeserializeObject<ShopGameResultModel<TheSieuReSubmitModel>>(await _transactionCardService.Charge(chagring));
                string partner_id = _configuration.GetValue<String>("partner_id");
                string partner_key = _configuration.GetValue<String>("partner_key");
                var sign = GetHash(partner_key + res.Results.FirstOrDefault().code + res.Results.FirstOrDefault().serial);
                var submit = res.Results.FirstOrDefault();
                submit.partner_id = partner_id;
                submit.sign = sign;
                submit.command = "charging";

                string jsonStr = JsonConvert.SerializeObject(submit);

                HttpClient httpClient = new HttpClient();
                //httpClient.BaseAddress = new Uri(url);
                //httpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                HttpContent content = new StringContent(jsonStr, Encoding.UTF8, "application/json");

                HttpResponseMessage response = httpClient.PostAsync(url, content).Result;  // Blocking call! Program will wait here until a response is received or a timeout occurs.
                if (response.IsSuccessStatusCode)
                {
                    string res1 = response.Content.ReadAsStringAsync().Result;
                    var data = JsonConvert.DeserializeObject(response.Content.ReadAsStringAsync().Result);
                    var resultData = JsonConvert.DeserializeObject<TheSieuReReturnModel>(JsonConvert.SerializeObject(data));
                    resultData.request_id = int.Parse(submit.request_id);
                    var callback = await _transactionCardService.Callback(resultData);
                    httpClient.Dispose();
                    return Json(resultData.status);
                }
                httpClient.Dispose();
                return Json(100);

            }
            return RedirectToAction("Index", "Login");
        }


        [HttpPost]
        public async Task<ActionResult> CallBack([FromBody]TheSieuReReturnModel returnModel)
        {
            var callback = await _transactionCardService.Callback(returnModel);
            return Json(true);
        }

        public static string GetHash(string plainText)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            // Compute hash from the bytes of text
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(plainText));
            // Get hash result after compute it
            byte[] result = md5.Hash;
            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                strBuilder.Append(result[i].ToString("x2"));
            }

            return strBuilder.ToString();
        }
    }
}
