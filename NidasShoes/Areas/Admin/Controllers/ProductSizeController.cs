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
    public class ProductSizeController : BaseController
    {
        IProductSizeService _productSizeService;
        IHostingEnvironment _hostingEnvironment;
        public ProductSizeController(IProductSizeService productSizeService, IHostingEnvironment hostingEnvironment)
        {
            _productSizeService = productSizeService;
            _hostingEnvironment = hostingEnvironment;
        }

        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _productSizeService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<SizeModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _productSizeService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<SizeModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new SizeModel()
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
        public async Task<IActionResult> AddOrUpdate(SizeModel obj)
        {
            var response = await _productSizeService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _productSizeService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }

        [HttpGet]
        public async Task<IActionResult> GetlistSize()
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageNumber =1,
                PageSize = 1000000,
                Search = ""
            };
            var response = await _productSizeService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<SizeModel>>(response);
            return Json(result.Results);
        }
    }
}
