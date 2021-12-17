using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using ShopGame.Service.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Common;

namespace WebApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class BlogController : BaseController
    {
        IHostingEnvironment _hostingEnvironment;
        IBlogTypeService _blogTypeService;
        public BlogController(IHostingEnvironment hostingEnvironment, IBlogTypeService blogTypeService)
        {
            _hostingEnvironment = hostingEnvironment;
            _blogTypeService = blogTypeService;
        }
        public IActionResult Index()
        {
            return View();
        }

        public async Task<IActionResult> Create(int? Id)
        {
            Id = Id ?? 0;
            ViewBag.Category = JsonConvert.DeserializeObject<ShopGameResultModel<BlogTypeModel>>(await _blogTypeService.GetListData(new BaseParamModel())).Results;
            if (Id > 0)
            {
                var res = await _blogTypeService.GetBlogById(Id ?? 0);
                var product = JsonConvert.DeserializeObject<ShopGameResultModel<BlogModel>>(res).Results.FirstOrDefault();
                if (product != null)
                    return View(product);
            }
            var productNew = new BlogModel();
            return View(productNew);
        }

        [HttpPost]
        public async Task<IActionResult> GetListData(BaseParamModel baseParam)
        {
            var res = await _blogTypeService.GetListDataBlog(baseParam);
            return PartialView(JsonConvert.DeserializeObject<ShopGameResultModel<BlogModel>>(res));
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate()
        {
            var request = HttpContext.Request.Form;
            var data = request.Where(x => x.Key == "data").First().Value;
            var product = JsonConvert.DeserializeObject<BlogModel>(data);
            List<string> images = await UploadFile.UploadFiles(request.Files.ToList(), _hostingEnvironment, CurrentUser.UserId);
            string avatar = images.Where(x => x.Contains("avatar") && images.IndexOf(x) == images.Count() - 1).FirstOrDefault();
            if (avatar != null)
            {
                product.Image = avatar;
            }
            else if (product.Id == 0)
            {
                product.Image = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            }

            var res = await _blogTypeService.AddOrUpdateBlog(product);
            return Json(JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(res).Results.FirstOrDefault());
        }


        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _blogTypeService.DeleteBlogById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
