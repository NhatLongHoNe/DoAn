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
    public class CardAdminController : BaseController
    {
        ICardAdminService _cardAdminService;
        public CardAdminController(ICardAdminService cardAdminService)
        {
            _cardAdminService = cardAdminService;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _cardAdminService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<CardAdminModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _cardAdminService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<CardAdminModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new CardAdminModel()
                {
                    Id = 0,
                    BankName = "",
                    CardNumber = "",
                    CardBranch = "",
                    CardHolder = "",
                    CardType =""
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(CardAdminModel obj)
        {

            var response = await _cardAdminService.AddOrUpdate(obj);
            return Json(response);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _cardAdminService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
