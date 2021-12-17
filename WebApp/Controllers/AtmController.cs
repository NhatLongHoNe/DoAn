using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using Newtonsoft.Json;
using ShopGame.Service.Model.ViewModel;

namespace WebApp.Controllers
{
    public class AtmController : Controller
    {
        private readonly ICardAdminService _cardAdminService;
        private readonly IMasterDataService _masterDataService;
        public AtmController(ICardAdminService cardAdminService, IMasterDataService masterDataService)
        {
            _cardAdminService = cardAdminService;
            _masterDataService = masterDataService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> _AtmView(BaseParamModel baseParam)
        {
            var res =  JsonConvert.DeserializeObject<ShopGameResultModel<CardAdminViewModel>>(await _cardAdminService.GetListData(baseParam));
            ViewBag.phone =  JsonConvert.DeserializeObject<ShopGameResultModel<MasterDataModel>>(await _masterDataService.GetListData(baseParam)).Results.Find(x=>x.Id == 3).Value;
            return PartialView(res);
        }
    }
}
