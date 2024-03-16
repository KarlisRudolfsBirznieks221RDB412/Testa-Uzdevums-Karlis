using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Xml;

namespace Testa_Uzdevums_Karlis
{
    public class CurrencyRate
    {
        public string CurrencyCode { get; set; }
        public decimal Rate { get; set; }
    }

    public class CurrencyRatesReader
    {
        public List<CurrencyRate> ReadCurrencyRatesFromXml(string xmlUrl)
        {
            List<CurrencyRate> rates = new List<CurrencyRate>();

            try
            {
                using (WebClient client = new WebClient())
                {
                    string xmlData = client.DownloadString(xmlUrl);
                    XmlDocument xmlDoc = new XmlDocument();
                    xmlDoc.LoadXml(xmlData);

                    XmlNamespaceManager namespaceManager = new XmlNamespaceManager(xmlDoc.NameTable);
                    namespaceManager.AddNamespace("ns", "http://www.bank.lv/vk/LBCurrencyRates.xsd");

                    XmlNodeList currencyNodes = xmlDoc.SelectNodes("//ns:Currency", namespaceManager);
                    foreach (XmlNode currencyNode in currencyNodes)
                    {
                        CurrencyRate rate = new CurrencyRate
                        {
                            CurrencyCode = currencyNode.SelectSingleNode("ns:ID", namespaceManager).InnerText,
                            Rate = Convert.ToDecimal(currencyNode.SelectSingleNode("ns:Rate", namespaceManager).InnerText)
                        };
                        rates.Add(rate);
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error reading currency rates: {ex.Message}");
            }

            return rates;
        }
    }
}