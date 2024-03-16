using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;

namespace Testa_Uzdevums_Karlis.Controllers
{
    public class HomeController : Controller
    {
        private readonly string _connectionString = "Server=(localdb)\\Local;Database=Currency_DB;Integrated Security=True;";

        public ActionResult Index()
        {
            CurrencyRatesReader reader = new CurrencyRatesReader();
            var currencyRates = reader.ReadCurrencyRatesFromXml("https://www.bank.lv/vk/ecb.xml?date=20050323");
            InsertCurrencyRatesToDb(currencyRates);
            ViewBag.CurrencyRates = currencyRates;
            return View();
        }

        private void InsertCurrencyRatesToDb(List<CurrencyRate> rates)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                foreach (var rate in rates)
                {
                    string sql = @"
                MERGE INTO dbo.CurrencyRates AS Target
                USING (VALUES (@CurrencyCode, @Rate)) AS Source (CurrencyCode, Rate)
                ON Target.CurrencyCode = Source.CurrencyCode
                WHEN MATCHED THEN
                    UPDATE SET Rate = Source.Rate
                WHEN NOT MATCHED THEN
                    INSERT (CurrencyCode, Rate) VALUES (Source.CurrencyCode, Source.Rate);";

                    SqlCommand command = new SqlCommand(sql, connection);
                    command.Parameters.AddWithValue("@CurrencyCode", rate.CurrencyCode);
                    command.Parameters.AddWithValue("@Rate", rate.Rate);

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}