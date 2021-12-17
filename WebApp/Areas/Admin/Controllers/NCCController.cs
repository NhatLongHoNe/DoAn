using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using ShopGame.Service.IService;
using ShopGame.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class NCCController : Controller
    {
        INCCService _nCCService;
        public NCCController(INCCService nCCService)
        {
            _nCCService = nCCService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _nCCService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<NCCModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _nCCService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<NCCModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new NCCModel()
                {
                    Id = 0,
                    Name = ""
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(NCCModel obj) { 

            var response = await _nCCService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _nCCService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
