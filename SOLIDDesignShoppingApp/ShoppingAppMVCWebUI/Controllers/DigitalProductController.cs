using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingLib;
using ShoppingAppMVCWebUI.Models;

namespace ShoppingAppMVCWebUI.Controllers
{
    public class DigitalProductController : Controller
    {
        // GET: DigitalProduct
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult DigitalBooks()
        {
            List<DigitalBook> books = DigitalBooksListModel.GenerateSampleData();
            Session["products"] = null;
            Session["products"] = books;
            return View(books);
        }

        public ActionResult DigitalMovies()
        {
            List<DigitalMovie> movies = DigitalMoviesListModel.GenerateSampleData();
            Session["products"] = null;
            Session["products"] = movies;
            return View(movies);
        }

        public ActionResult DigitalMusicAlbums()
        {
            List<DigitalMusicAlbum> albums = DigitalMusicAlbumsListModel.GenerateSampleData();
            Session["products"] = null;
            Session["products"] = albums;
            return View(albums);
        }

        //private void ProductSessionInitializer(List<IProduct> products)
        //{
        //    Session["products"] = null;
        //    Session["products"] = products;
        //}
    }
}