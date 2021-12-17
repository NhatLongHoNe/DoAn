using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
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
    public class MasterDataController : BaseController
    {
        IMasterDataService _masterDataService;
        IHostingEnvironment _hostingEnvironment;
        public MasterDataController(IMasterDataService masterDataService, IHostingEnvironment hostingEnvironment)
        {
            _masterDataService = masterDataService;
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _masterDataService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<MasterDataModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _masterDataService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<MasterDataModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new MasterDataModel()
                {
                    Id = 0,
                    Name = "",
                    Code = "",
                    Value = ""
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(MasterDataModel obj)
        {
            var response = await _masterDataService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _masterDataService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
        [HttpPost]
        public async Task<IActionResult> UploadImage()
        {
            var formData = HttpContext.Request.Form.Files.FirstOrDefault();
            if (formData == null)
                return Json(false);

            var res = await UploadFile.UploadFiles(new List<IFormFile>() { formData }, _hostingEnvironment, CurrentUser.UserId);
            var model = new MasterDataModel()
            {
                Id = 4,
                Code = "logo",
                Name = "Logo",
                Value = res.FirstOrDefault()
            };
            var response = await _masterDataService.AddOrUpdate(model);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result);
        }
        [HttpPost]
        public async Task<IActionResult> UploadBackGround()
        {
            var formData = HttpContext.Request.Form.Files.FirstOrDefault();
            if (formData == null)
                return Json(false);

            var res = await UploadFile.UploadFiles(new List<IFormFile>() { formData }, _hostingEnvironment, CurrentUser.UserId);
            var model = new MasterDataModel()
            {
                Id = 5,
                Code = "backgroud",
                Name = "Hình nền",
                Value = res.FirstOrDefault()
            };
            var response = await _masterDataService.AddOrUpdate(model);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result);
        }
    }
}
