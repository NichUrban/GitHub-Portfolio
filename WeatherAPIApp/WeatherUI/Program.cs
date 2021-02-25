using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WeatherAPILib;

namespace WeatherUI
{
    class Program
    {
        static async Task Main(string[] args)
        {
            APIHelper.InitializeClient(); // **always add at the start of an application

            List<CitySearchModel> search = await CitySearchProcessor.LoadSearchInformation("chicago"); 

            WeatherDetailsModel chicago = await WeatherProcessor.LoadWeatherInformation(search[0].Woeid); 

            Console.WriteLine();
            Console.WriteLine($"Here is today's and the following 5 day's weather forecast for {chicago.Title}:");
            Console.WriteLine("_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_");
            Console.WriteLine();

            foreach (var day in chicago.Consolidated_Weather)
            {
                Console.WriteLine("---------------------------------------------");
                Console.WriteLine($"Date: {day.Applicable_Date.ToShortDateString()}");
                Console.WriteLine($"Weather: {day.Weather_State_Name}");
                Console.WriteLine($"Min-Temp: {day.Min_Temp}");
                Console.WriteLine($"Max-Temp: {day.Max_Temp}");
                Console.WriteLine($"Humidity: {day.Humidity}");
            }



            // END
            Console.ReadLine();
        }
    }
}
