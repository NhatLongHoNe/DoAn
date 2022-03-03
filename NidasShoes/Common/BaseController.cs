using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApp.Common
{
    public class BaseController : Controller
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            base.OnActionExecuting(context);
            var info = new byte[0];
            if(context.HttpContext.Session.TryGetValue("User", out info))
            {
                if (info.Length == 0)
                {
                }
            }
            else
            {
                context.Result = new RedirectResult("/Admin/Authentication/Index");
            }
        }
    }
}
