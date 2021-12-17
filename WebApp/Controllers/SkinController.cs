using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using ShopGame.Service.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApp.Controllers
{
    public class SkinController : Controller
    {
        ISkinCategoryService _skinCategoryService;
        ISkinService _skinService;
        IAuthenticationService _authenticationService;
        IHostingEnvironment _hostingEnvironment;
        IProductService _productService;
        IStepService _stepService;
        public SkinController(ISkinCategoryService blogTypeService, 
            IAuthenticationService authenticationService, 
            IHostingEnvironment hostingEnvironment,
            ISkinService skinService,
            IProductService productService,
            IStepService stepService
            )
        {
            _skinCategoryService = blogTypeService;
            _authenticationService = authenticationService;
            _hostingEnvironment = hostingEnvironment;
            _skinService = skinService;
            _productService = productService;
            _stepService = stepService;
        }
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> SkinCategory(int skinCategoryId, int? pageSize, int? pageNumber, string? search)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageSize = pageSize ?? 20,
                PageNumber = pageNumber ?? 1,
                Search = search ?? ""
            };
            var res = JsonConvert.DeserializeObject<ShopGameResultModel<SkinViewModel>>(await _skinService.GetListDataSkinBySkinCategoryId(skinCategoryId, baseParam));
            ViewBag.SkinCategory = JsonConvert.DeserializeObject<ShopGameResultModel<SkinCategoryViewModel>>(await _skinCategoryService.GetById(skinCategoryId)).Results[0];

            return View(res);
        }
        public async Task<IActionResult> Detail(int SkinId)
        {
            var baseParam = new BaseParamModel();
            ViewBag.Step = JsonConvert.DeserializeObject<ShopGameResultModel<StepModel>>(await _stepService.GetListData(baseParam)).Results.Find(x=>x.Status == true);
            var res = JsonConvert.DeserializeObject<ShopGameResultModel<SkinViewModel>>(await _skinService.GetById(SkinId)).Results[0];
            return View(res);
        }

        [HttpPost]
        public async Task<IActionResult> Buy(int Id,string Name)
        {
            var byteArrr = new byte[0];
            if (HttpContext.Session.TryGetValue("User_Client", out byteArrr))
            {
                // check code in here
                var user = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(byteArrr));
                var res = JsonConvert.DeserializeObject<ShopGameResultModel<int>>(await _productService.BuySkin(Id, user.Id,Name));
                return Json(res.Results.FirstOrDefault());
            }
            return Json(-1);
        }
    }
}
