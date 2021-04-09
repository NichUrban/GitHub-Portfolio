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
            Session["products"] = null; 
            Session["products"] = books;
            return View(books);
        }

        public ActionResult PhysicalMovies()
        {
            List<PhysicalMovieDVD> movies = PhysicalMoviesListModel.GenerateSampleData();
            Session["products"] = null;
            Session["products"] = movies;
            return View(movies);
        }

        public ActionResult PhysicalMusicAlbums()
        {
            List<PhysicalMusicAlbumCD> albums = PhysicalMusicAlbumsListModel.GenerateSampleData();
            Session["products"] = null;
            Session["products"] = albums;
            return View(albums);
        }
    }
}