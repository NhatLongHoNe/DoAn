using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
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
    public class SkinController : BaseController
    {
        ISkinService _skinService;
        ISkinCategoryService _skinCategoryService;
        IHostingEnvironment _hostingEnvironment;
        public SkinController(ISkinCategoryService skinCategoryService,ISkinService productService, IHostingEnvironment hostingEnvironment)
        {
            _skinService = productService;
            _hostingEnvironment = hostingEnvironment;
            _skinCategoryService = skinCategoryService;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _skinService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<SkinModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            ViewBag.category = JsonConvert.DeserializeObject<ShopGameResultModel<SkinCategoryModel>>(await _skinCategoryService.GetListData(new BaseParamModel())).Results;
            var response = await _skinService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<SkinModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new SkinModel()
                {
                    Id = 0,
                    Name = "",
                    Image="",
                    SkinCategoryId = 0,
                    Price =0
                });
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
            var categoryProduct = JsonConvert.DeserializeObject<SkinModel>(data);
            if (images.Count() > 0)
            {
                categoryProduct.Image = images.FirstOrDefault();
            }
            else if (categoryProduct.Id == 0)
            {
                categoryProduct.Image = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            }
            var response = await _skinService.AddOrUpdate(categoryProduct);
            return Json(response);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _skinService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
