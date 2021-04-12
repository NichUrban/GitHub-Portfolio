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
        // Cart index page
        public ActionResult Index()
        {
            List<IProduct> products = (List<IProduct>)Session["cart"];
            Cart cart = new Cart();
            cart.Items = products;
            // ADD SHOPPER AS WELL

            return View(cart);
        }

        // Add products to the cart
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
                Session["count"] = Convert.ToInt32(Session["count"]) + 1;
            }
        }

        public ActionResult AddPhysicalBook(PhysicalBook item) 
        {
            Add(item);
            
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

        // UNDER CONSTRUCTION
        //
        // Remove items from the cart
        public void Remove(IProduct item)
        {
            List<IProduct> products = (List<IProduct>)Session["cart"];

            foreach (var prod in products)
            {
                if (item.ProductIDNum == prod.ProductIDNum)
                {
                    products.Remove(prod);
                    break;
                }
            }
            
            Session["cart"] = products;
            Session["count"] = Convert.ToInt32(Session["count"]) - 1;
        }

        public ActionResult RemovePhysicalBook(PhysicalBook item)
        {
            Remove(item);

            return RedirectToAction("Index", "Cart");
        }

        public ActionResult RemovePhysicalMovie(PhysicalMovieDVD item)
        {
            Remove(item);

            return RedirectToAction("Index", "Cart");
        }

        public ActionResult RemovePhysicalMusicAlbum(PhysicalMusicAlbumCD item)
        {
            Remove(item);

            return RedirectToAction("Index", "Cart");
        }

        public ActionResult RemoveDigitalBook(DigitalBook item)
        {
            Remove(item);

            return RedirectToAction("Index", "Cart");
        }

        public ActionResult RemoveDigitalMovie(DigitalMovie item)
        {
            Remove(item);

            return RedirectToAction("Index", "Cart");
        }

        public ActionResult RemoveDigitalMusicAlbum(DigitalMusicAlbum item)
        {
            Remove(item);

            //return RedirectToAction("Index", "Cart");
            return Redirect(Request.UrlReferrer.PathAndQuery);
        }
    }
}