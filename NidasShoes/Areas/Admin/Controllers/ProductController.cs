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
    public class ProductController : BaseController
    {
        IHostingEnvironment _hostingEnvironment;
        IProductService _productService;
        public ProductController(IHostingEnvironment hostingEnvironment, IProductService productService)
        {
            _hostingEnvironment = hostingEnvironment;
            _productService = productService;
        }
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Create(int? Id)
        {
            Id = Id ?? 0;
            ViewBag.Category = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductCategoryModel>>(await _productService.GetListData(new BaseParamModel())).Results;
            if (Id > 0)
            {
                var res = await _productService.GetByProductId(Id ?? 0);
                var product = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductModel>>(res);
                if (product.Results.FirstOrDefault() != null)
                {
                    var images = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductImageModel>>(await _productService.GetProductImageByProductID(Id ?? 0));
                    product.Results.FirstOrDefault().ProductImage.AddRange(images.Results);
                    return View(product.Results.FirstOrDefault());
                }
            }
            var productNew = new ProductModel();
            return View(productNew);
        }

        [HttpPost]
        public async Task<IActionResult> GetListData(BaseParamModel baseParam)
        {
            var res = await _productService.GetListDataProduct(baseParam);
            return PartialView(JsonConvert.DeserializeObject<NidasShoesResultModel<ProductModel>>(res));
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate()
        {
            var request = HttpContext.Request.Form;
            var data = request.Where(x => x.Key == "data").First().Value;
            var product = JsonConvert.DeserializeObject<ProductModel>(data);
            List<string> images = new List<string>();
            images.AddRange(product.ProductImage.Select(x => x.Image).ToList());
            images.AddRange(await UploadFile.UploadFiles(request.Files.ToList(), _hostingEnvironment, CurrentUser.UserId));
            string avatar = images.Where(x => x.Contains("avatar") && images.IndexOf(x) == images.Count() - 1).FirstOrDefault();
            if (product.ID == 0)
            {
                product.Image = avatar ?? "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            }
            else if (avatar != null)
            {
                product.Image = avatar;
            }

            if (avatar != null) images.Remove(avatar);
            // create productImage
            var productImage = new List<ProductImageModel>();
            foreach (var img in images)
            {
                productImage.Add(new ProductImageModel()
                {
                    ID = 0,
                    Image = img,
                    ProductID = 0
                });
            }
            var res = await _productService.AddOrUpdateProduct(product, productImage);
            return Json(JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(res).Results.FirstOrDefault());
        }


        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _productService.DeleteProductById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
