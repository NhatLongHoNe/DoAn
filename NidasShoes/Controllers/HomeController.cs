using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using NidasShoes.Service.IService;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace NidasShoes.Controllers
{
    public class HomeController : Controller
    {
        private readonly ISlideService _slideService;
        
        public HomeController(ISlideService slideService)
        {
            _slideService = slideService;
        }
        public async Task<IActionResult> Index(BaseParamModel baseParam)
        {
            ViewBag.Slides = JsonConvert.DeserializeObject<NidasShoesResultModel<SlideModel>>(await _slideService.GetListData(baseParam));


            return View();
        }
    }
}
