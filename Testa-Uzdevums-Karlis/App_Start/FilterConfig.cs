using System.Web;
using System.Web.Mvc;

namespace Testa_Uzdevums_Karlis
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
