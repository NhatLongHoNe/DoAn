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
using WebApp.Common;

namespace WebApp.Controllers
{
    public class UserController : Controller
    {
        IConfiguration _configuration;
        IUserService _userService;

        public UserController(IUserService userService, IConfiguration configuration)
        {
            _userService = userService;
            _configuration = configuration;
        }
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> Profile()
        {
            byte[] arr = new byte[0];

            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));
                var result = JsonConvert.DeserializeObject<ShopGameResultModel<UserModel>>(await _userService.GetById(json.Id)).Results.FirstOrDefault();
                return View(result);
            }
            return RedirectToAction("Index", "Login");
        }
        public IActionResult ChangePassword()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> ChangePasswordPost(string oldPassword, string password,string rePassword)
        {
            byte[] arr = new byte[0];

            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));

                string hashedOld = Hash.Encrypt(oldPassword ?? "", _configuration.GetValue<String>("PrivateKey"));
                if (json.HashedPassword != hashedOld)
                    return Json("WrongPass");

                string hashed = Hash.Encrypt(password ?? "", _configuration.GetValue<String>("PrivateKey"));
                var user = new UserModel()
                {
                    Id = json.Id,
                    UserName = json.UserName,
                    HashedPassword = hashed,
                    Name = json.Name??"",
                    Email = json.Email,
                    Balance = json.Balance,
                    Phone = json.Phone??""
                };
                var response = await _userService.AddOrUpdate(user);
                var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
                if (result.Results[0] == false)
                    return Json(false);

                //set lại ss
                var userss = JsonConvert.DeserializeObject<ShopGameResultModel<UserModel>>(await _userService.GetById(json.Id)).Results.FirstOrDefault();
                HttpContext.Session.Set("User_Client", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(userss)));
                return Json(true);

            }
            return RedirectToAction("Index", "Login");
        }
        public async Task<IActionResult> CreateOrEditPhoneNumber()
        {
            return Json(true);
        }

    }
}
