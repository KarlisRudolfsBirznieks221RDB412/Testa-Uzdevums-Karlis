using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using Testa_Uzdevums_Karlis;

public class DatabaseManager
{


    private readonly string _connectionString = "Server=(localdb)\\Local;Database=Currency_DB;Integrated Security=True;";

    public void SaveCurrencyRatesToDatabase(List<CurrencyRate> rates)
    {
        try
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();
                Console.WriteLine("Connection opened successfully.");

                foreach (CurrencyRate rate in rates)
                {
                    using (SqlCommand cmd = new SqlCommand("InsertCurrencyRate", connection))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CurrencyCode", rate.CurrencyCode);
                        cmd.Parameters.AddWithValue("@Rate", rate.Rate);
                        Console.WriteLine($"Saving currency rate for {rate.CurrencyCode}");
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error saving currency rates to database: {ex.Message}");
        }
    }
}
