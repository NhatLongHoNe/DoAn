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
    public class BlogTypeController : BaseController
    {
        IBlogTypeService _blogTypeService;
        public BlogTypeController(IBlogTypeService blogTypeService)
        {
            _blogTypeService = blogTypeService;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _blogTypeService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<BlogTypeModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _blogTypeService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<BlogTypeModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new BlogTypeModel()
                {
                    Id = 0,
                    Name = "",
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(BlogTypeModel obj)
        {
            
            var response = await _blogTypeService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _blogTypeService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
