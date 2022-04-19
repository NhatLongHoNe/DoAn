﻿using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApp.Common;

namespace WebApp.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SupplyController : BaseController
    {
        ISupplyService _supplyService;
        public SupplyController(ISupplyService supplyService)
        {
            _supplyService = supplyService;
        }
        public IActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _supplyService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<SupplyModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _supplyService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<SupplyModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new SupplyModel()
                {
                    ID = 0,
                    Name = "",
                    Phone ="",
                    Address="",
                    Description=""
                });
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate(SupplyModel obj) { 

            var response = await _supplyService.AddOrUpdate(obj);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.FirstOrDefault());
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _supplyService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
