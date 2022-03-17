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
    public class ProductCategoryController : BaseController
    {
        IProductService _productService;
        IAuthenticationService _authenticationService;
        IHostingEnvironment _hostingEnvironment;
        public ProductCategoryController(IProductService productService,IAuthenticationService authenticationService,IHostingEnvironment hostingEnvironment)
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
            var response = await _productService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductCategoryModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _productService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<ProductCategoryModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new ProductCategoryModel()
                {
                    ID = 0,
                    Name = "",
                    Description = "",
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate()
        {
            var request = HttpContext.Request.Form;
            var files = request.Files.ToList();
            List<string> images = await UploadFile.UploadFiles(files,_hostingEnvironment,CurrentUser.UserId);
            var data = request.Where(x=>x.Key=="data").First().Value;
            var categoryProduct = JsonConvert.DeserializeObject<ProductCategoryModel>(data);
            //if (images.Count() > 0)
            //{
            //    categoryProduct. = images.FirstOrDefault();
            //}
            //else if(categoryProduct.Id == 0)
            //{
            //    categoryProduct.Image = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            //}
            var response = await _productService.AddOrUpdate(categoryProduct);
            return Json(response);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _productService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
