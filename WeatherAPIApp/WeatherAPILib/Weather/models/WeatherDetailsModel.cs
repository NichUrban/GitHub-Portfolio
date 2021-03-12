using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeatherAPILib
{
    public class WeatherDetailsModel // all the property names match the  key-value key names (newtonsoft)
    {
        public List<WeatherModel> Consolidated_Weather { get; set; } // a property that's a list of another class model to hold the nested json objects

        public string Title { get; set; }

        public int Woeid { get; set; }

    }
}
