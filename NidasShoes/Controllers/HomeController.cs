using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NidasShoes.Controllers
{
    public class HomeController : Controller
    {
        private readonly ISlideService _slideService;
        private readonly IProductService _productService;
        private readonly IShopService _shopService;

        public HomeController(ISlideService slideService, IProductService productService, IShopService shopService)
        {
            _slideService = slideService;
            _productService = productService;
            _shopService = shopService;

        }
        public async Task<IActionResult> Index(BaseParamModel baseParam)
        {
            ViewBag.Slides = JsonConvert.DeserializeObject<NidasShoesResultModel<SlideModel>>(await _slideService.GetListData(baseParam));
            ViewBag.Products = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductModel>>(await _productService.GetListDataClientProduct(baseParam));
            ViewBag.Shop = JsonConvert.DeserializeObject<NidasShoesResultModel<ShopModel>>(await _shopService.GetListData(baseParam)).Results.FirstOrDefault();

            return View();
        }
    }
}
