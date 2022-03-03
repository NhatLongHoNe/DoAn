using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Common
{
    public static class UploadFile
    {
        public static async Task<List<string>> UploadFiles(List<IFormFile> ListImage, IHostingEnvironment _hostingEnvironment,int UserId)
        {
            List<string> data = new List<string>();
            try
            {
                if (ListImage != null)
                {
                    if (ListImage.Count > 0)
                    {
                        foreach (var upload in ListImage)
                        {
                            var fileName = UserId.ToString() + DateTime.Now.ToString("yyyyMMddHHmmss") + upload.FileName;
                            if(upload.Name.Contains("avatar"))
                                fileName = UserId.ToString() + DateTime.Now.ToString("yyyyMMddHHmmss") + "avatar."+upload.FileName.Split(".")[1];
                            var path = Path.Combine(Directory.GetCurrentDirectory(), _hostingEnvironment.WebRootPath, "Admin/Content/Upload", fileName);
                            var stream = new FileStream(path, FileMode.Create);
                            await upload.CopyToAsync(stream);
                            data.Add("/Admin/Content/Upload/"+fileName);
                        }
                    }
                }
            }
            catch(Exception e)
            {

            }
            
            return data;
        }
    }
}