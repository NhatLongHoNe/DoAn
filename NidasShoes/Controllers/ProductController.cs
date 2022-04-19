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
        private readonly IProductSizeService _sizeService;
        private readonly IProductColorService _colorService;

        public ProductController(
             IProductService productService
            , IProductReviewService productReviewService
            , IProductColorService colorService
            ,IProductSizeService sizeService
            )
        {
            _productService = productService;
            _productReviewService = productReviewService;
            _colorService = colorService;
            _sizeService = sizeService;

        }
        public async Task<IActionResult> Index(int? pageSize, int? pageNumber, string? search)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageSize = pageSize ?? 15,
                PageNumber = pageNumber ?? 1,
                Search = search ?? ""
            };
            //baseParam.PageSize = pageSize ?? 16;

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

        public async Task<IActionResult> ProductSearchClient()
        {
            BaseParamModel baseParamModel = new BaseParamModel()
            {
                PageNumber = 1,
                PageSize = 100000000,
                Search = ""
            };

            ViewBag.ListColor = JsonConvert.DeserializeObject<NidasShoesResultModel<ColorModel>>(await _colorService.GetListData(baseParamModel));
            ViewBag.ListSize = JsonConvert.DeserializeObject<NidasShoesResultModel<SizeModel>>(await _sizeService.GetListData(baseParamModel));
            ViewBag.ListProductCategory = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductCategoryModel>>(await _productService.GetListData(baseParamModel));


            return View();
        }

        public async Task<IActionResult> ProductSearch(int productCategoryID, int sizeID, int colorID)
        {
            var dataJson = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductModel>>(await _productService.GetListProductClientBySearch(productCategoryID,sizeID,colorID));


            return Json(new
            {
                data = dataJson,
                status = true
            });

        }


    }
}
