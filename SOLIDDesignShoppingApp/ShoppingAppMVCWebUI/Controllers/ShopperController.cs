using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ShoppingAppMVCWebUI.Controllers
{
    public class ShopperController : Controller
    {
        // GET: Shopper
        public ActionResult Index()
        {
            return View();
        }
    }
}