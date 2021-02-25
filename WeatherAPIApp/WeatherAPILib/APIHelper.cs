using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace WeatherAPILib
{
    public static class APIHelper
    {
        public static HttpClient ApiClient { get; set; }

        public static void InitializeClient() // creates one connection to the API at the start of the application
        {
            ApiClient = new HttpClient();
            //ApiClient.BaseAddress = new Uri("--------"); 
            ApiClient.DefaultRequestHeaders.Accept.Clear();
            ApiClient.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
        }
    }
}
