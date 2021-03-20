using ShoppingLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingAppMVCWebUI.Models;

namespace ShoppingAppMVCWebUI.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult PhysicalBooks()
        {
            List<PhysicalBook> books = PhysicalBooksListModel.GenerateSampleData();
            return View(books);
        }

        public ActionResult PhysicalMovies()
        {
            return View();
        }

        public ActionResult PhysicalMusicAlbums()
        {
            return View();
        }

        public ActionResult DigitalBooks()
        {
            return View();
        }

        public ActionResult DigitalMovies()
        {
            return View();
        }

        public ActionResult DigitalMusicAlbums()
        {
            return View();
        }
    }
}