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
    public class ProductController : Controller
    {
        private readonly IProductService _productService;
        public ProductController(IProductService productService)
        {
            _productService = productService;
        }
        public IActionResult Index()
        {
            return View();
        }
        public async Task<IActionResult> ProductCategory(int ProductCategoryId, int? pageSize, int? pageNumber, string? search)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageSize = pageSize ?? 20,
                PageNumber = pageNumber ?? 1,
                Search = search ?? ""
            };
            var res = JsonConvert.DeserializeObject<ShopGameResultModel<ProductViewModel>>(await _productService.GetListDataProductByProductCategoryId(ProductCategoryId, baseParam));
            ViewBag.ProductCategory = JsonConvert.DeserializeObject<ShopGameResultModel<ProductCategoryViewModel>>(await _productService.GetById(ProductCategoryId)).Results[0];

            return View(res);
        }

        public async Task<IActionResult> Detail(int productId)
        {
            var res = JsonConvert.DeserializeObject<ShopGameResultModel<ProductViewModel>>(await _productService.GetByProductId(productId)).Results[0];
            ViewBag.Images = JsonConvert.DeserializeObject<ShopGameResultModel<ProductImageModel>>(await _productService.GetProductImage(productId)).Results;
            // xét category i
            return View(res);
        }

        [HttpPost]
        public async Task<IActionResult> Buy(int Id)
        {
            var byteArrr = new byte[0];
            if (HttpContext.Session.TryGetValue("User_Client", out byteArrr))
            {
                // check code in here
                var user = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(byteArrr));
                var res = JsonConvert.DeserializeObject<ShopGameResultModel<int>>(await _productService.BuyAccount(Id, user.Id));
                return Json(res.Results.FirstOrDefault());
            }
            return Json(-1);
        }
    }
}
