using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using NidasShoes.Service.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WebApp.Common
{
    public static class CurrentUser
    {
        static HttpContextAccessor httpContextAccessor = new HttpContextAccessor();
        public static int UserId
        {
            get
            {
                var byteArr = new Byte[0];
                var check = httpContextAccessor.HttpContext.Session.TryGetValue("User", out byteArr);
                if (check)
                {
                    var user = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(byteArr));
                    return user.Id;
                }
                return 0;
            }
            set
            {

            }
        }
        public static UserModel User
        {
            get
            {
                var byteArr = new Byte[0];
                var check = httpContextAccessor.HttpContext.Session.TryGetValue("User", out byteArr);
                if (check)
                {
                    var user = JsonConvert.DeserializeObject<UserModel>(Encoding.UTF8.GetString(byteArr));
                    return user;
                }
                return null;
            }
            set
            {

            }
        }
    }
}
