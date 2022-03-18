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
        public async Task<IActionResult> Index(int? pageSize, int? pageNumber, string? search)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageSize = pageSize ?? 10,
                PageNumber = pageNumber ?? 1,
                Search = search ?? ""
            };
            baseParam.PageSize = pageSize ?? 4;

            var res = await _productService.GetListDataClientProduct(baseParam);
            ViewBag.Search = search;
            //ViewBag. = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductModel>>(await _blogTypeService.GetListData(new BaseParamModel()));

            return View(JsonConvert.DeserializeObject<NidasShoesResultModel<ProductModel>>(res));
        }

        public async Task<IActionResult> Detail(int ID, int sizeID, int colorID)
        {
            var product = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailClientModel>>(await _productService.GetProductDetailClient(ID, sizeID, colorID));
            ViewBag.productImages = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductImageModel>>(await _productService.GetProductImageByProductID(ID));
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
