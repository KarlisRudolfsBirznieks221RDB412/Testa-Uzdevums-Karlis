using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Testa_Uzdevums_Karlis.Controllers
{
    public class CurrencyController : Controller
    {
        public ActionResult Index()
        {
            CurrencyRatesReader reader = new CurrencyRatesReader();
            List<CurrencyRate> rates = reader.ReadCurrencyRatesFromXml("https://www.bank.lv/vk/ecb.xml?date=20050323");

            DatabaseManager dbManager = new DatabaseManager();
            dbManager.SaveCurrencyRatesToDatabase(rates);

            return View(rates);
        }
    }
}