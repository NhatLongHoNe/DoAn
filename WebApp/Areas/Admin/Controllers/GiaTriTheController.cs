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
    public class GiaTriTheController : BaseController
    {
        IGiaTriTheService _giaTriTheService;
        IHostingEnvironment _hostingEnvironment;
        public GiaTriTheController(IGiaTriTheService giaTriTheService, IHostingEnvironment hostingEnvironment)
        {
            _giaTriTheService = giaTriTheService;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _giaTriTheService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<GiaTriTheModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _giaTriTheService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<GiaTriTheModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new GiaTriTheModel()
                {
                    Id = 0,
                    Name = "",
                    Value = 0,
                    Percent = 0
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(GiaTriTheModel obj)
        {
            var response = await _giaTriTheService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _giaTriTheService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
