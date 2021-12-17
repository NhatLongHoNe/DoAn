using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using ShopGame.Repository.Entity;
using ShopGame.Repository.IRepository;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using ShopGame.Service.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly ICommonRepository _commonRepository;
        private readonly IClientSlideService _clientSlideService;
        private readonly INotificationService _notificationService;
        private readonly IProductService _productService;
        private readonly ISkinCategoryService _skinCategoryService;
        public HomeController(ILogger<HomeController> logger,
            ICommonRepository commonRepository,
            IClientSlideService clientSlideService,
            INotificationService notificationService,
            IProductService productService,
            ISkinCategoryService skinCategoryService
        )
        {
            _logger = logger;
            _commonRepository = commonRepository;
            _clientSlideService = clientSlideService;
            _notificationService = notificationService;
            _productService = productService;
            _skinCategoryService = skinCategoryService;
        }

        public async Task<IActionResult> Index(BaseParamModel baseParam)
        {
            //byte[] arr = new byte[0];

            //if(HttpContext.Session.TryGetValue("User_Client", out arr))
            //{
            //    var json = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(arr));
            //}
            ViewBag.Slides = JsonConvert.DeserializeObject<ShopGameResultModel<SliderViewModel>>(await _clientSlideService.GetListSlide(baseParam));
            var listNotification = JsonConvert.DeserializeObject<ShopGameResultModel<NotificationViewModel>>(await _notificationService.GetListData(baseParam));
            ViewBag.Notification  = listNotification.Results.Find(x => x.Status == true);
            ViewBag.listProductCategory = JsonConvert.DeserializeObject<ShopGameResultModel<ProductCategoryViewModel>>(await _productService.GetListData(baseParam)).Results;
            
            ViewBag.listSkinCategory = JsonConvert.DeserializeObject<ShopGameResultModel<SkinCategoryModel>>(await _skinCategoryService.GetListData(baseParam)).Results;


            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
