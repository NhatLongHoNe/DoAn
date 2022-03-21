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

namespace NidasShoes.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductColorController : Controller
    {
        IProductColorService _productColorService;
        IHostingEnvironment _hostingEnvironment;
        public ProductColorController(IProductColorService productColorService, IHostingEnvironment hostingEnvironment)
        {
            _productColorService = productColorService;
            _hostingEnvironment = hostingEnvironment;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _productColorService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ColorModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _productColorService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ColorModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new ColorModel()
                {
                    ID = 0,
                    Name =""
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(ColorModel obj)
        {
            var response = await _productColorService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _productColorService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
