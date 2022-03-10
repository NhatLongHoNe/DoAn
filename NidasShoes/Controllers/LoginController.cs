
using MailKit.Security;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using MimeKit;
using Newtonsoft.Json;
using NidasShoes.Service.Model;
using NidasShoes.Service.IService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp.Common;
namespace WebApp.Controllers
{
    public class LoginController : Controller
    {
        IConfiguration _configuration;
        IAuthenticationService _userService;
        string appid = string.Empty;
        string appsecret = string.Empty;

        public LoginController(IAuthenticationService userService, IConfiguration configuration)
        {
            _userService = userService;
            _configuration = configuration;
            appid = _configuration.GetValue<String>("AppID");
            appsecret = _configuration.GetValue<String>("AppSecret");
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> LoginClient(string username, string password)
        {
            // hashed password
            string hashed = Hash.Encrypt(password ?? "", _configuration.GetValue<String>("PrivateKey"));
            var user = new UserModel()
            {
                Id = 0,
                UserName = username,
                HashedPassword = hashed
            };
            var response = await _userService.Login(user);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(response);
            if (result.Results.Count() == 0)
                return Json(false);
            HttpContext.Session.Set("User_Client", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(result.Results.FirstOrDefault())));
            return Json(true);
        }
        [HttpPost]
        public async Task<IActionResult> CheckSession()
        {
            
            byte[] arr = new byte[0];

            if (HttpContext.Session.TryGetValue("User_Client", out arr))
            {
                var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));
                var result = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(await _userService.GetById(json.Id)).Results.FirstOrDefault();
                return Json(result);
            }
            return Json(false);
        }
        [HttpPost]
        public async Task<IActionResult> LogOut()
        {
            HttpContext.Session.Remove("User_Client");
            return Json(true);
        }
        [HttpPost]
        public async Task<IActionResult> Register(string username,string email,string password,string rePassword)
        {
            if (password != rePassword)
                return Json(false);
            if (username == null || email == null||password == null || rePassword == null)
                return Json(false);
            if (password.Length < 6)
                return Json(false);

            string hashed = Hash.Encrypt(password ?? "", _configuration.GetValue<String>("PrivateKey"));

            var user = new UserModel()
            {
                UserName = username,
                Email = email,
                HashedPassword = hashed,
                RuleID = 4
            };
            var response = await _userService.AddOrUpdate(user);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            if (result.Results[0] == false)
                return Json(false);

            return Json(true);
        }

        [HttpPost]
        public async Task<IActionResult> ForgotPassword(string Email)
        {
            var newPassword = RandomString(8);
            string hashed = Hash.Encrypt(newPassword, _configuration.GetValue<String>("PrivateKey"));
            var check = JsonConvert.DeserializeObject<NidasShoesResultModel<int>>(await _userService.ForgotPassword(Email, hashed));
            if(check.Results.First() > 0)
            {
                MimeMessage message = new MimeMessage();

                MailboxAddress from = new MailboxAddress("Shop game ShopBanGame",
                "nhatdevuser0002@gmail.com");
                message.From.Add(from);

                MailboxAddress to = new MailboxAddress("",Email);
                message.To.Add(to);

                message.Subject = "Thư gửi quên mật khẩu";
                message.Body = new BodyBuilder()
                {
                    TextBody = "Mật khẩu mới của bạn là " + newPassword
                }.ToMessageBody();

                using var smtp = new MailKit.Net.Smtp.SmtpClient();

                try
                {
                    smtp.Connect("smtp.gmail.com", 587, SecureSocketOptions.StartTls);
                    smtp.Authenticate("nhatdevuser0002@gmail.com", "Nhat1111");
                    await smtp.SendAsync(message);
                }
                catch (Exception ex)
                {
                }

                smtp.Disconnect(true);

                return Json(true);
            }

            return Json(false);
        }


        static Random random = new Random();
        public static string RandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
            return new string(Enumerable.Repeat(chars, length)
              .Select(s => s[random.Next(s.Length)]).ToArray());
        }
        // login fb

        //private Uri RedirectUri
        //{
        //    get
        //    {
        //        var uriBuilder = new UriBuilder(Request.Headers["Referer"].ToString());
        //        uriBuilder.Query = null;
        //        uriBuilder.Fragment = null;
        //        uriBuilder.Path = Url.Action("FacebookCallback");
        //        return uriBuilder.Uri;
        //    }
        //}
        //public IActionResult Facebook()
        //{
        //    //var fb = new FacebookClient();
        //    //var loginurl = fb.GetLoginUrl(new
        //    //{
        //    //    client_id = appid,
        //    //    client_secret = appsecret,
        //    //    redirect_uri = RedirectUri.AbsoluteUri,
        //    //    response_type = "code",
        //    //    scope = "email"
        //    //});
        //    return Challenge(new AuthenticationProperties { RedirectUri="/" });
        //}
        //public async Task<IActionResult> FacebookCallback(string code)
        //{
        //    var result = await HttpContext.AuthenticateAsync(CookieAuthenticationDefaults.AuthenticationScheme);

        //    var claims = result.Principal.Identities
        //        .FirstOrDefault().Claims.Select(claim => new
        //        {
        //            claim.Issuer,
        //            claim.OriginalIssuer,
        //            claim.Type,
        //            claim.Value
        //        });
        //    var demo = code;
        //    return Json(claims);
        //}
        ////public async Task<IActionResult> FacebookCallback(string code)
        ////{
        ////    if(code == null)
        ////    {
        ////        return RedirectToAction("Index", "Login");
        ////    }
        ////    var fb = new FacebookClient();
        ////    dynamic result =  fb.Post("oauth/access_token", new
        ////    {
        ////        client_id = appid,
        ////        client_secret = appsecret,
        ////        redirect_uri = RedirectUri.AbsoluteUri,
        ////        code = code
        ////    });
        ////    var accesstoken = result.access_token;
        ////    fb.AccessToken = accesstoken;
        ////    dynamic data = fb.Get("me?fields=link,first_name,currency,last_name,email,gender,locale,timezone,verified,picture,age_range");

        ////    var baseparam = new BaseParamModel()
        ////    {
        ////        Search = data.email,
        ////        PageNumber = 1,
        ////        PageSize = 1
        ////    };

        ////    var responseCheckUser = await _userService.GetListData(baseparam);
        ////    var checkUser = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(responseCheckUser).Results.FirstOrDefault();
        ////    if(checkUser != null)
        ////    {
        ////        var user = new UserModel()
        ////        {
        ////            UserName = data.email,
        ////            Email = data.email,
        ////            HashedPassword = checkUser.HashedPassword
        ////        };
        ////        var response = await _userService.Login(user);
        ////        var resultLogin = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(response);
        ////        if (resultLogin.Results.Count() == 0)
        ////            return Json(false);

        ////        HttpContext.Session.Set("User_Client", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(resultLogin.Results.FirstOrDefault())));
        ////        return RedirectToAction("Index", "Home");
        ////    }
        ////    else
        ////    {
        ////        var user = new UserModel()
        ////        {
        ////            UserName = data.email,
        ////            Email = data.email,
        ////            HashedPassword = Hash.Encrypt(data.email, _configuration.GetValue<String>("PrivateKey"))
        ////    };
        ////        var response = await _userService.AddOrUpdate(user);
        ////        var resultRegister = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
        ////        if (resultRegister.Results[0] == false)
        ////            return Json(false);

        ////        var responseCheckUser2 = await _userService.GetListData(baseparam);
        ////        var checkUser2 = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(responseCheckUser2).Results.FirstOrDefault();
        ////        HttpContext.Session.Set("User_Client", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(checkUser2)));
        ////        return RedirectToAction("Index", "Home");
        ////    }

        ////    return RedirectToAction("Index", "Login");
        ////}
    }
}
