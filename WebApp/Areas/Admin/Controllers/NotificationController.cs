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
    public class NotificationController : BaseController
    {
        INotificationService _notificationService;
        IHostingEnvironment _hostingEnvironment;
        public NotificationController(INotificationService notificationService, IHostingEnvironment hostingEnvironment)
        {
            _notificationService = notificationService;
            _hostingEnvironment = hostingEnvironment;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<PartialViewResult> GetListData(BaseParamModel baseParam)
        {
            var response = await _notificationService.GetListData(baseParam);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<NotificationModel>>(response);
            return PartialView(result);
        }

        [HttpPost]
        public async Task<PartialViewResult> _AddOrEdit(int Id)
        {
            var response = await _notificationService.GetById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<NotificationModel>>(response);
            if (result.Results.Count() == 0)
            {
                return PartialView(new NotificationModel()
                {
                    Id = 0,
                    Image = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg",
                    Content = "",
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
            var categorynotification = JsonConvert.DeserializeObject<NotificationModel>(data);
            if (images.Count() > 0)
            {
                categorynotification.Image = images.FirstOrDefault();
            }
            else if (categorynotification.Id == 0)
            {
                categorynotification.Image = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
            }
            var response = await _notificationService.AddOrUpdate(categorynotification);
            return Json(response);
        }

        [HttpPost]
        public async Task<IActionResult> DeleteById(int Id)
        {
            var response = await _notificationService.DeleteById(Id);
            var result = JsonConvert.DeserializeObject<ShopGameResultModel<bool>>(response);
            return Json(result.Results.First());
        }
    }
}
