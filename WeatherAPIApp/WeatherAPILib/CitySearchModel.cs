using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeatherAPILib
{
    public class CitySearchModel // all the property names match the json key-value key names (newtonsoft)
    {
        public string Title { get; set; }

        public int Woeid { get; set; }
    }
}
