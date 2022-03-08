using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
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
    public class SlideController : BaseController
    {
        ISlideService _slideService;
        IHostingEnvironment _hostingEnvironment;
        public SlideController(ISlideService productService, IHostingEnvironment hostingEnvironment)
        {
            _slideService = productService;
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _slideService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<SlideModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _slideService.GetById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<SlideModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new SlideModel()
                {
                    ID = 0,
                    Image = "",
                    Title = "",
                    DisplayOrder = 0,
                    Link = "",
                    Status = true
                }) ;
            }
            else
            {
                return PartialView(result.Results.FirstOrDefault());
            }
        }

        [HttpPost]
        public async Task<IActionResult> AddOrUpdate()
        {
            var request = HttpContext.Request.Form;
            var files = request.Files.ToList();
            List<string> images = await UploadFile.UploadFiles(files, _hostingEnvironment, CurrentUser.UserId);
            var data = request.Where(x => x.Key == "data").First().Value;
            var categoryProduct = JsonConvert.DeserializeObject<SlideModel>(data);
            if (images.Count() > 0)
            {
                categoryProduct.Image = images.FirstOrDefault();
            }
            else if (categoryProduct.ID == 0)
            {
                categoryProduct.Image = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            }
            var response = await _slideService.AddOrUpdate(categoryProduct);
            return Json(response);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _slideService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<NidasShoesResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
