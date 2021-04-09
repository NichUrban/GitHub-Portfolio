using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ShoppingLib;

namespace ConsoleUI
{
    public class Checkout
    {
        private ICart _cart;
        public ICart Cart 
        {
            get { return _cart; }  
        } 

        public Checkout(ICart cart)
        {
            _cart = cart;
        }

        // simulates an online shopping cart checkout
        public string DisplayCheckOutMessage()
        {
            string checkoutInfo = $"Your total is: ${ Cart.Total }.\n";

            foreach (var item in Cart.Items)
            {
                if (item is IPhysicalBook book)
                {
                    checkoutInfo += $"Your book \"{ book.Title }\" is ready for shipping.\n";
                }

                if (item is IPhysicalMovie movie)
                {
                    checkoutInfo += $"Your movie \"{ movie.Title }\" is ready for shipping.\n";
                }

                if (item is IPhysicalMusicAlbum musicAlbum)
                {
                    checkoutInfo += $"Your music album \"{ musicAlbum.Title }\" is ready for shipping.\n";
                }
            }

            foreach (var item in Cart.Items)
            {
                if (item is IDigitalBook digitalBook)
                {
                    checkoutInfo += $"{ digitalBook.DownloadsLeft } downloads available for your e-book \"{ digitalBook.Title }\".\n";
                }

                if (item is IDigitalMovie digitalMovie)
                {
                    checkoutInfo += $"{ digitalMovie.DownloadsLeft } downloads available for your movie \"{ digitalMovie.Title }\".\n";
                }

                if (item is IDigitalMusicAlbum digitalMusicAlbum)
                {
                    checkoutInfo += $"{ digitalMusicAlbum.DownloadsLeft } downloads available for music album \"{ digitalMusicAlbum.Title }\".\n";
                }
            }

            checkoutInfo += "Digital products are available for download in your user profile, and physical products will ship within 3 business days.\n" +
                            "Thank You for shopping with us!";

            return checkoutInfo;
        }
    }
}
