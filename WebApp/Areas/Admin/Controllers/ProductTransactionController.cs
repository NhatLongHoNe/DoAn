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
    public class ProductTransactionController : BaseController
    {
        IHostingEnvironment _hostingEnvironment;
        IProductTransactionService _productTransactionService;
        public ProductTransactionController(IHostingEnvironment hostingEnvironment, IProductTransactionService productTransactionService)
        {
            _hostingEnvironment = hostingEnvironment;
            _productTransactionService = productTransactionService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _productTransactionService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<ProductTransactionViewModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _productTransactionService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<ProductTransactionViewModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new ProductTransactionViewModel()
                {
                    Id = 0,
                    Status = 0
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(ProductTransactionViewModel obj)
        {

            var response = await _productTransactionService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _productTransactionService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
