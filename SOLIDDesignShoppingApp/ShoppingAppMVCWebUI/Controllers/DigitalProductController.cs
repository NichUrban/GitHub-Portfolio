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
            return View(books);
        }

        public ActionResult DigitalMovies()
        {
            List<DigitalMovie> movies = DigitalMoviesListModel.GenerateSampleData();
            return View(movies);
        }

        public ActionResult DigitalMusicAlbums()
        {
            List<DigitalMusicAlbum> albums = DigitalMusicAlbumsListModel.GenerateSampleData();
            return View(albums);
        }
    }
}