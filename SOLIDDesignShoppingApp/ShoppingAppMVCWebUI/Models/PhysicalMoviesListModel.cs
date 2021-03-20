using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoppingLib;

namespace ShoppingAppMVCWebUI.Models
{
    public static class PhysicalMoviesListModel
    {
        public static List<PhysicalMovieDVD> GenerateSampleData()
        {
            return new List<PhysicalMovieDVD>
            {
                new PhysicalMovieDVD(65432, 18.99M) { NumberOfDisks =  1, InStock =  true, Title = "Summer of Romance", DirectedBy = "Fantas Marjorie", RunTimeInMinutes = 72.66 },
                new PhysicalMovieDVD(54321, 25.59M) { NumberOfDisks =  2, InStock =  true, Title = "Wise Guys", DirectedBy = "Ben Nottingham", RunTimeInMinutes = 55.33 },
                new PhysicalMovieDVD(43210, 16.99M) { NumberOfDisks =  3, InStock =  true, Title = "Dragon Warriors Trilogy", DirectedBy = "Octavian Eris", RunTimeInMinutes = 245.75},
            };
        }
    }
}