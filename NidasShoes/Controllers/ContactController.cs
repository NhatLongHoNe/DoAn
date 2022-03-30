using Microsoft.AspNetCore.Mvc;

namespace NidasShoes.Controllers
{
    public class ContactController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
