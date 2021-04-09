using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoppingLib;

namespace ShoppingAppMVCWebUI.Models
{
    public static class PhysicalBooksListModel
    {
        public static List<PhysicalBook> GenerateSampleData() // EXPERIMENTING
        {
            return new List<PhysicalBook> 
            { 
                new PhysicalBook(98765, 44.79M) { Pages = 451, InStock = true, Title = "Ancient Rome", Author = "Titus Pullo" },
                new PhysicalBook(87654, 28.95M) { Pages = 236, InStock = true, Title = "How to Code", Author = "Linus Gates" },
                new PhysicalBook(76543, 14.99M) { Pages = 180, InStock = true, Title = "Essential Recipes", Author = "Lao Chao" }
            };
        }

    }
}