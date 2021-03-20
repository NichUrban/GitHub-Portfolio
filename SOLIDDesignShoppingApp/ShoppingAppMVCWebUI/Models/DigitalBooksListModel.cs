using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoppingLib;

namespace ShoppingAppMVCWebUI.Models
{
    public static class DigitalBooksListModel
    {
        public static List<DigitalBook> GenerateSampleData()
        {
            return new List<DigitalBook>
            {
                new DigitalBook(12345, 25.99M) { Title = "Reading in the Digital Age", Author = "Jeff Scorpio" },
                new DigitalBook(23456, 16.99M) { Title = "Dragon Slaying Adventures", Author = "Edmund Sagittarius" },
                new DigitalBook(34567, 21.99M) { Title = "The Greylock Mysteries", Author = "Julia Leo" }
            };
        }
    }
}