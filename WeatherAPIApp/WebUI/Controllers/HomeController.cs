using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using WeatherAPILib;
using WebUI.Models;

namespace WebUI.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            //APIHelper.InitializeClient(); // this does work here, however it might be better if placed in BundleConfig.cs (?)
            return View();
        }

        [HttpGet]
        public async Task<ActionResult> CityForm(string data)
        {
            ViewBag.City = data;

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