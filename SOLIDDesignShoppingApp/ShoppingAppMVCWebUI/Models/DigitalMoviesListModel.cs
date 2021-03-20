using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using ShoppingLib;

namespace ShoppingAppMVCWebUI.Models
{
    public static class DigitalMoviesListModel
    {
        public static List<DigitalMovie> GenerateSampleData()
        {
            return new List<DigitalMovie>
            {
                new DigitalMovie(45678, 20.99M) { Title = "Action Park", DirectedBy = "Eugene Mulvihill", RunTimeInMinutes =  92.45 },
                new DigitalMovie(56789, 10.59M) { Title = "Fast Cars", DirectedBy = "Siri Appleton", RunTimeInMinutes = 58.35 },
                new DigitalMovie(67890, 5.49M) { Title = "Master Guitar 101", DirectedBy = "Shred Davis", RunTimeInMinutes = 96.25 }
            };
        }
    }
}