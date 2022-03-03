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
    public class UserController : BaseController
    {
        IAuthenticationService _authenticationService;
        IConfiguration _configuration;
        public UserController(IConfiguration configuration, IAuthenticationService authenticationService)
        {
            _authenticationService = authenticationService;
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
            var response = await _authenticationService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _authenticationService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new UserModel()
                {
                    Id = 0,
                    UserName = "",
                    HashedPassword = "",
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
           
            if (obj.HashedPassword!=null)
            {
                obj.HashedPassword = Hash.Encrypt(obj.HashedPassword, _configuration.GetValue<string>("PrivateKey"));
            }
            else
            {
                obj.HashedPassword = JsonConvert.DeserializeObject<NidasShoesResultModel<UserModel>>(await _authenticationService.GetById(obj.Id)).Results.FirstOrDefault().HashedPassword;
            }
            var response = await _authenticationService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _authenticationService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
