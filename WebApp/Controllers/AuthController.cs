using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.Facebook;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Text;
using WebApp.Common;
using Microsoft.Extensions.Configuration;
using ShopGame.Service.IService;

namespace WebApp.Controllers
{
    [Route("Auth")]
    [AllowAnonymous]
    public class AuthController : Controller
    {
        IConfiguration _configuration;
        IUserService _userService;

        public AuthController(IUserService userService, IConfiguration configuration)
        {
            _userService = userService;
            _configuration = configuration;
        }
        [Route("Facebook")]
        public IActionResult Facebook()
        {
            var properties = new AuthenticationProperties
            {
                RedirectUri = Url.Action("FacebookCallback")
            };
            return Challenge(properties,FacebookDefaults.AuthenticationScheme);
        }
        [Route("FacebookCallback")]
        public async Task<IActionResult> FacebookCallback()
        {
            var res = await HttpContext.AuthenticateAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            var claims = res.Principal.Identities.FirstOrDefault().Claims.Select(claim => new
            {
                claim.Issuer,
                claim.OriginalIssuer,
                claim.Type,
                claim.Value
            });

            var email = claims.Where(x=>x.Type.Contains("mail")).FirstOrDefault().Value;

            if (claims == null)
            {
                return RedirectToAction("Index", "Login");
            }

            var baseparam = new BaseParamModel()
            {
                Search = email,
                PageNumber = 1,
                PageSize = 1
            };

            var responseCheckUser = await _userService.GetListData(baseparam);
            var checkUser = JsonConvert.DeserializeObject<ShopGameResultModel<UserModel>>(responseCheckUser).Results.FirstOrDefault();
            if (checkUser != null)
            {
                var user = new UserModel()
                {
                    UserName = email,
                    Email = email,
                    HashedPassword = checkUser.HashedPassword
                };
                var response = await _userService.Login(user);
                var resultLogin = JsonConvert.DeserializeObject<ShopGameResultModel<UserModel>>(response);
                if (resultLogin.Results.Count() == 0)
                    return Json(false);

                HttpContext.Session.Set("User_Client", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(resultLogin.Results.FirstOrDefault())));
                return RedirectToAction("Index", "Home");
            }
            else
            {
                var user = new UserModel()
                {
                    UserName = email,
                    Email = email,
                    HashedPassword = Hash.Encrypt(email, _configuration.GetValue<String>("PrivateKey"))
                };
                var response = await _userService.AddOrUpdate(user);
                var resultRegister = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
                if (resultRegister.Results[0] == false)
                    return Json(false);

                var responseCheckUser2 = await _userService.GetListData(baseparam);
                var checkUser2 = JsonConvert.DeserializeObject<ShopGameResultModel<UserModel>>(responseCheckUser2).Results.FirstOrDefault();
                HttpContext.Session.Set("User_Client", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(checkUser2)));
                return RedirectToAction("Index", "Home");
            }

            return RedirectToAction("Index", "Login");
        }
    }
    
}
