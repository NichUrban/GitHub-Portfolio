using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

namespace WeatherAPILib
{
    public static class CitySearchProcessor
    {
        public static async Task<List<CitySearchModel>> LoadSearchInformation(string city) // returns a list containing search results
        {
            string baseUrl = "https://www.metaweather.com/api/location/search/?query=";

            using (HttpResponseMessage response = await APIHelper.ApiClient.GetAsync($"{baseUrl}{city}"))
            {
                if (response.IsSuccessStatusCode)
                {
                    List<CitySearchModel> result = await response.Content.ReadAsAsync<List<CitySearchModel>>(); 
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
