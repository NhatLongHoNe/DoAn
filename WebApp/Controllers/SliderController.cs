using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShopGame.Repository.Entity;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using ShopGame.Service.Model.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Controllers
{
    public class SliderController : Controller
    {
        IHostingEnvironment _hostingEnvironment;
        IClientSlideService _clientSlideService;
        INCCService _nCCService;
        IGiaTriTheService _giaTriTheService;
        public SliderController(IHostingEnvironment hostingEnvironment, 
            IClientSlideService clientSlideService , 
            INCCService nCCService,
            IGiaTriTheService giaTriTheService
            )
        {
            _hostingEnvironment = hostingEnvironment;
            _clientSlideService = clientSlideService;
            _nCCService = nCCService;
            _giaTriTheService = giaTriTheService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> _GetSliders()
        {
            return PartialView();
        }
        [HttpPost]
        public async Task<IActionResult> GetNCC(BaseParamModel baseParam)
        {
            var listNCC = JsonConvert.DeserializeObject<ShopGameResultModel<NCCModel>>(await _nCCService.GetListData(baseParam));
            return Json(listNCC);
        }
        [HttpPost]
        public async Task<IActionResult> GetGiaTriThe(BaseParamModel baseParam)
        {
            var listGiaTriThe = JsonConvert.DeserializeObject<ShopGameResultModel<GiaTriTheModel>>(await _giaTriTheService.GetListData(baseParam));
            return Json(listGiaTriThe);
        }
    }
}
