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

namespace WebApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class ProductDetailController : BaseController
    {
        IProductService _productService;
        IAuthenticationService _authenticationService;
        IHostingEnvironment _hostingEnvironment;
        public ProductDetailController(IProductService productService,IAuthenticationService authenticationService,IHostingEnvironment hostingEnvironment)
        {
            _productService = productService;
            _authenticationService = authenticationService;
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _productService.GetListDataProductDetail(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _productService.GetProductDetailById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductDetailModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new ProductDetailModel()
                {
                    ID = 0,
                    ProductID = 0,
                    SizeID = 0,
                    ColorID = 0,
                    Quantity = 0,
                    Image = "",
                    ImportPrice=0,
                    ExportPrice=0
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(ProductDetailModel obj)
        {
            var request = HttpContext.Request.Form;
            var files = request.Files.ToList();
            List<string> images = await UploadFile.UploadFiles(files, _hostingEnvironment, CurrentUser.UserId);
            var data = request.Where(x => x.Key == "data").First().Value;
            var productDetail = JsonConvert.DeserializeObject<ProductDetailModel>(data);
            if (images.Count() > 0)
            {
                productDetail.Image = images.FirstOrDefault();
            }
            else if (productDetail.ID == 0)
            {
                productDetail.Image = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            }

            var response = await _productService.AddOrUpdateProductDetail(productDetail);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _productService.DeleteProductDetailById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
