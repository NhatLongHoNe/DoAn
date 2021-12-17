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
    public class SkinCategoryController : BaseController
    {
        ISkinCategoryService _skinCategoryService;
        IAuthenticationService _authenticationService;
        IHostingEnvironment _hostingEnvironment;
        public SkinCategoryController(ISkinCategoryService blogTypeService, IAuthenticationService authenticationService, IHostingEnvironment hostingEnvironment)
        {
            _skinCategoryService = blogTypeService;
            _authenticationService = authenticationService;
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _skinCategoryService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<SkinCategoryModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _skinCategoryService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<SkinCategoryModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new SkinCategoryModel()
                {
                    Id = 0,
                    Name = "",
                    Description = "",
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
            var categorySkin = JsonConvert.DeserializeObject<SkinCategoryModel>(data);
            if (images.Count() > 0)
            {
                categorySkin.Image = images.FirstOrDefault();
            }
            else if (categorySkin.Id == 0)
            {
                categorySkin.Image = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            }
            var response = await _skinCategoryService.AddOrUpdate(categorySkin);
            return Json(response);

            //var response = await _skinCategoryService.AddOrUpdate(obj);
            //var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            //return Json(result.Results.First());


        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _skinCategoryService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
