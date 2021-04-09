using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ShoppingLib;

namespace ShoppingAppMVCWebUI.Controllers
{
    public class CartController : Controller
    {
        public ActionResult Index()
        {
            List<IProduct> products = (List<IProduct>)Session["cart"];
            Cart cart = new Cart();
            cart.Items = products;

            return View(cart);
        }

        public ActionResult AddPhysicalBook(PhysicalBook book) 
        {
            Add(book);
            
            return Redirect(Request.UrlReferrer.PathAndQuery);
        }

        public ActionResult AddPhysicalMovie(PhysicalMovieDVD item) 
        {
            Add(item);

            return Redirect(Request.UrlReferrer.PathAndQuery);
        }

        public ActionResult AddPhysicalMusicAlbum(PhysicalMusicAlbumCD item) 
        {
            Add(item);

            return Redirect(Request.UrlReferrer.PathAndQuery);
        }

        public ActionResult AddDigitalBook(DigitalBook item) 
        {
            Add(item);

            return Redirect(Request.UrlReferrer.PathAndQuery);
        }

        public ActionResult AddDigitalMovie(DigitalMovie item) 
        {
            Add(item);

            return Redirect(Request.UrlReferrer.PathAndQuery);
        }

        public ActionResult AddDigitalMusicAlbum(DigitalMusicAlbum item) 
        {
            Add(item);

            return Redirect(Request.UrlReferrer.PathAndQuery);
        }

        private void Add(IProduct item)
        {
            if (Session["cart"] == null)
            {
                List<IProduct> products = new List<IProduct>();

                products.Add(item);
                Session["cart"] = products;
                //ViewBag.cart = products.Count();

                Session["count"] = 1;
            }
            else
            {
                List<IProduct> products = (List<IProduct>)Session["cart"];
                products.Add(item);
                Session["cart"] = products;
                //ViewBag.cart =products.Count();
                Session["count"] = Convert.ToInt32(Session["count"]) + 1;
            }
        }
    }
}