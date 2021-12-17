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
    public class StepController : BaseController
    {
        IStepService _stepService;
        IHostingEnvironment _hostingEnvironment;
        public StepController(IStepService stepService, IHostingEnvironment hostingEnvironment)
        {
            _stepService = stepService;
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _stepService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<StepModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _stepService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<StepModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new StepModel()
                {
                    Id = 0,
                    Content = "",
                    Status = true
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(StepModel obj)
        {
            var response = await _stepService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _stepService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
