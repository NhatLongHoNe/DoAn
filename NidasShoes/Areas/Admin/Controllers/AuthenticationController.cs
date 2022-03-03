using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp.Common;

namespace WebApp.Controllers
{
    [Area("Admin")]
    public class AuthenticationController : Controller
    {
        IAuthenticationService _authenticationService;
        IConfiguration _configuration;
        public AuthenticationController(IAuthenticationService authenticationService,IConfiguration configuration)
        {
            _authenticationService = authenticationService;
            _configuration = configuration;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(string username, string password)
        {
            // hashed password
            string hashed =  Hash.Encrypt(password??"", _configuration.GetValue<String>("PrivateKey"));
            var account = new UserModel()
            {
                Id = 0,
                UserName = username,
                HashedPassword = hashed
            };
            var response = await _authenticationService.Login(account);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(response);
            if (result.Results.Count() == 0)
                return Json(false);
            HttpContext.Session.Set("User", Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(result.Results.FirstOrDefault())));
            return Json(true);
        }
    }
}
