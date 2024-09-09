using Microsoft.AspNetCore.Mvc;
using Nice_admin_form___table.Models;
using System.Diagnostics;

namespace Nice_admin_form___table.Controllers
{
	public class HomeController : Controller
	{
		private readonly ILogger<HomeController> _logger;

		public HomeController(ILogger<HomeController> logger)
		{
			_logger = logger;
		}

		public IActionResult Index()
		{
			return View();
		}
        public IActionResult department()
        {
            return View();
        }
        public IActionResult employeeproject()
        {
            return View();
        }
        public IActionResult datatables()
        {
            return View();
        }
        public IActionResult project()
        {
            return View();
        }
        public IActionResult formproject()
        {
            return View();
        }
        public IActionResult formdepartment()
        {
            return View();
        }

        public IActionResult formemployee()
        {
            return View();
        }
        public IActionResult formemployeeproject()
        {
            return View();
        }
        public IActionResult Privacy()
		{
			return View();
		}
        

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
		public IActionResult Error()
		{
			return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
		}
	}
}
