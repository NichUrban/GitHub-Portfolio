using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using WeatherAPILib;

namespace WebUI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            
            //APIHelper.InitializeClient(); // this does work here, however it might be better if placed in BundleConfig.cs (?)

            //List<CitySearchModel> search = await CitySearchProcessor.LoadSearchInformation(ViewBag.City);

            //WeatherDetailsModel city = await WeatherProcessor.LoadWeatherInformation(search[0].Woeid);

            //List<WeatherModel> forecast = city.Consolidated_Weather;

            return View();
        }

        [HttpGet]
        public async Task<ActionResult> CityForm(string data)
        {
            List<CitySearchModel> search = await CitySearchProcessor.LoadSearchInformation(data);
            List<WeatherModel> forecast = new List<WeatherModel>();

            try
            {
                WeatherDetailsModel city = await WeatherProcessor.LoadWeatherInformation(search[0].Woeid);
                forecast = city.Consolidated_Weather;
            }
            catch (ArgumentOutOfRangeException)
            {
                return View("Index", forecast);
            }
            

            

            return View("Index", forecast);
        }
    }
}