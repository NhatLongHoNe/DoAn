using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Controllers
{
    public class MasterDataController : Controller
    {
        private readonly IMasterDataService _masterDataService;
        public MasterDataController(IMasterDataService masterDataService)
        {
            _masterDataService = masterDataService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> MasterDataView(BaseParamModel baseParam)
        {
            var res = JsonConvert.DeserializeObject<ShopGameResultModel<MasterDataModel>>(await _masterDataService.GetListData(baseParam));
            return Json(res);
        }
    }
}
