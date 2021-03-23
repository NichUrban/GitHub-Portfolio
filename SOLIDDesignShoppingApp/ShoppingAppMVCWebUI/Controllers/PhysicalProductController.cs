using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingLib;
using ShoppingAppMVCWebUI.Models;

namespace ShoppingAppMVCWebUI.Controllers
{
    public class PhysicalProductController : Controller
    {
        // GET: PhysicalProduct
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
            List<PhysicalMovieDVD> movies = PhysicalMoviesListModel.GenerateSampleData();
            return View(movies);
        }

        public ActionResult PhysicalMusicAlbums()
        {
            List<PhysicalMusicAlbumCD> albums = PhysicalMusicAlbumsListModel.GenerateSampleData();
            return View(albums);
        }
    }
}