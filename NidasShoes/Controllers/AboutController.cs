using Microsoft.AspNetCore.Mvc;

namespace NidasShoes.Controllers
{
    public class AboutController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
