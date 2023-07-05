using Humanizer;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using TestCafe.Models;

namespace TestCafe.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        static IndexModel model = new();

        public IActionResult MainMenu()
        {
            using (TestCafeContext db = new TestCafeContext())
            {
                model.categories = db.Categories.Where(c => !c.name.Contains("Drinks")).ToList();
                model.items = db.MenuItems.Include(i => i.Category).Where(i => !i.Category.name.Contains("Drinks")).ToList();
            }
            model.NavSelected = "MainMenu";
            return RedirectToAction("Index");
        }
        public IActionResult DrinkMenu()
        {
            using (TestCafeContext db = new TestCafeContext())
            {
                model.categories = db.Categories.Where(c => c.name.Contains("Drinks")).ToList();
                model.items = db.MenuItems.Include(i => i.Category).Where(i => i.Category.name.Contains("Drinks")).ToList();
            }
            model.NavSelected = "DrinkMenu";
            return RedirectToAction("Index");
        }
        public IActionResult AboutMe()
        {
            model.NavSelected = "AboutMe";
            return View(model);
        }
        public IActionResult Contacts()
        {
            model.NavSelected = "Contacts";
            return View(model);
        }

        public IActionResult Index()
        {
            return View(model);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}