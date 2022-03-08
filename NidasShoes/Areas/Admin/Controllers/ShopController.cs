using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
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
    public class ShopController : BaseController
    {
        IShopService _shopService;
        IHostingEnvironment _hostingEnvironment;
        public ShopController(IShopService productService, IHostingEnvironment hostingEnvironment)
        {
            _shopService = productService;
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _shopService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ShopModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _shopService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ShopModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new ShopModel()
                {
                    ID = 0,
                    Name ="",
                    Logo ="",
                    Slogan ="",
                    Address="",
                    PhoneNumber ="",
                    Email=""
                   
                }) ;
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate()
        {
            var request = HttpContext.Request.Form;
            var files = request.Files.ToList();
            List<string> images = await UploadFile.UploadFiles(files, _hostingEnvironment, CurrentUser.UserId);
            var data = request.Where(x => x.Key == "data").First().Value;
            var shopModel = JsonConvert.DeserializeObject<ShopModel>(data);
            if (images.Count() > 0)
            {
                shopModel.Logo = images.FirstOrDefault();
            }
            else if (shopModel.ID == 0)
            {
                shopModel.Logo = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            }
            var response = await _shopService.AddOrUpdate(shopModel);
            return Json(response);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _shopService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
