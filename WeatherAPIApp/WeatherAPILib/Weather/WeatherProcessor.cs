using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace WeatherAPILib
{
    public static class WeatherProcessor
    {
        public static async Task<WeatherDetailsModel> LoadWeatherInformation(int woeid) // takes in one city's 'woeid' number and returns the weather model with the 5 day weather
        {
            string baseUrl = "https://www.metaweather.com/api/locationlocation/";

            using (HttpResponseMessage response = await APIHelper.ApiClient.GetAsync($"{baseUrl}{woeid}/"))
            {
                if (response.IsSuccessStatusCode)
                {
                    WeatherDetailsModel result = await response.Content.ReadAsAsync<WeatherDetailsModel>();
                    return result;
                }
                else
                {
                    throw new Exception(response.ReasonPhrase);
                }
            }

        }
    }
}
