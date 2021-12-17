using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Common;

namespace WebApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class UserController : BaseController
    {
        IUserService _userService;
        IConfiguration _configuration;
        public UserController(IConfiguration configuration, IUserService userService)
        {
            _userService = userService;
            _configuration = configuration;
        }
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _userService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<UserModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _userService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<UserModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new UserModel()
                {
                    Id = 0,
                    UserName = "",
                    HashedPassword = "1",
                    Name = "",
                    Email = "",
                    Balance = 0,
                    Phone = ""
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(UserModel obj)
        {
            obj.HashedPassword = Hash.Encrypt(obj.HashedPassword, _configuration.GetValue<string>("PrivateKey"));
            if(obj.Id != 0)
            {
                obj.HashedPassword = JsonConvert.DeserializeObject<ShopGameResultModel<UserModel>>(await _userService.GetById(obj.Id)).Results.FirstOrDefault().HashedPassword;
            }
            var response = await _userService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _userService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
