using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingLib;

namespace ShoppingAppMVCWebUI.Controllers
{
    public class ShopperController : Controller
    {
        // GET: Shopper
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GuestSignIn()
        {
            GuestShopper shopper = new GuestShopper() { FirstName = "Guest", LastName = "Shopper" };
            Session["shopper"] = shopper;

            return RedirectToAction("Index", "Shopper");
        }

        public ActionResult MemberSignIn()
        {
            MemberShopper member = new MemberShopper() { FirstName = "Member", LastName = "Shopper" };
            Session["shopper"] = member;

            return RedirectToAction("Index", "Shopper");
        }

        public ActionResult EmployeeSignIn()
        {
            EmployeeShopper employee = new EmployeeShopper() { FirstName = "Employee", LastName = "Shopper" };
            Session["shopper"] = employee;

            return RedirectToAction("Index", "Shopper");
        }
    }
}