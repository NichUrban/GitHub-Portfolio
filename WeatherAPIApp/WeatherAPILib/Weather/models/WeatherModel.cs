using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WeatherAPILib
{
    public class WeatherModel // all the property names match the  key-value key names (newtonsoft)
    {
        public string Weather_State_Name { get; set; }

        public DateTime Applicable_Date { get; set; }

        public double Min_Temp { get; set; }

        public double Max_Temp { get; set; }

        public int Humidity { get; set; }
    }
}
