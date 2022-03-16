using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System.Linq;
using System.Threading.Tasks;

namespace NidasShoes.Controllers
{
    public class ProductController : Controller
    {
        private readonly IProductService _productService;
        private readonly IProductReviewService _productReviewService;

        public ProductController(ISlideService slideService
            , IProductService productService
            , IProductReviewService productReviewService 
            )
        {
            _productService = productService;
            _productReviewService = productReviewService;

        }
        public async Task<IActionResult> Index()
        {
            return View();
        }

        public async Task<IActionResult> Detail(int ID, int sizeID, int colorID)
        {
            var product = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailClientModel>>(await _productService.GetProductDetailClient(ID, sizeID, colorID));
            ViewBag.productImages = JsonConvert.DeserializeObject<NidasShoesResultModel<ImagesModel>>(await _productService.GetProductImageByProductID(ID));
            ViewBag.productSize = JsonConvert.DeserializeObject<NidasShoesResultModel<SizeModel>>(await _productService.GetProductSizeByProductID(ID));
            ViewBag.productColor = JsonConvert.DeserializeObject<NidasShoesResultModel<ColorModel>>(await _productService.GetProductColorByProductID(ID));
            
            ViewBag.productRating = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductReviewModel>>(await _productReviewService.GetRateingReviewByProductID(ID));
            ViewBag.productReview = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductReviewModel>>(await _productReviewService.GetByProductId(ID));
            
            
            if (!product.Results.Any() || product.Results == null ||product.Results.Count() ==0)
            {
                return Redirect("~/Error.html");
            }
            return View(product);
        }
        public async Task<IActionResult> AjaxDetail(int ID, int sizeID, int colorID)
        {
            var product = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailClientModel>>(await _productService.GetProductDetailClient(ID, sizeID, colorID));
            return Json(product.Results.FirstOrDefault());
        }
    }
}
