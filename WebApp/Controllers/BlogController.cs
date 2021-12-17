using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using ShopGame.Service.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Controllers
{
    public class BlogController : Controller
    {
        IHostingEnvironment _hostingEnvironment;
        IBlogTypeService _blogTypeService;
        public BlogController(IHostingEnvironment hostingEnvironment, IBlogTypeService blogTypeService)
        {
            _hostingEnvironment = hostingEnvironment;
            _blogTypeService = blogTypeService;
        }
        public async Task<IActionResult> Index(int? pageSize, int? pageNumber, string? search)
        {
            BaseParamModel baseParam = new BaseParamModel()
            {
                PageSize = pageSize??10,
                PageNumber = pageNumber??1,
                Search = search??""
            };
            baseParam.PageSize = pageSize??5;
            var res = await _blogTypeService.GetListDataBlog(baseParam);
            ViewBag.Search = search;
            ViewBag.BlogTypes = JsonConvert.DeserializeObject<ShopGameResultModel<BlogViewTypeModel>>(await _blogTypeService.GetListData(new BaseParamModel()));

            return View(JsonConvert.DeserializeObject<ShopGameResultModel<BlogViewModel>>(res));
        }
        public IActionResult _MenuRight()
        {
            return View();
        }
        public async Task<IActionResult> Detail(int Id, BaseParamModel baseParam)
        {
            var res = await _blogTypeService.GetBlogById(Id);
            ViewBag.BlogTypes = JsonConvert.DeserializeObject<ShopGameResultModel<BlogViewTypeModel>>(await _blogTypeService.GetListData(baseParam));

            var blog = JsonConvert.DeserializeObject<ShopGameResultModel<BlogViewModel>>(res);
            return View(blog.Results[0]);
        }
    }
}
