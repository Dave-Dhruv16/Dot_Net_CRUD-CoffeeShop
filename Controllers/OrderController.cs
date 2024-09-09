using Microsoft.AspNetCore.Mvc;
using Nice_admin_form___table.Models;
using System.Data.SqlClient;
using System.Data;

namespace Nice_admin_form___table.Controllers
{
    public class OrderController : Controller
    {
        private IConfiguration configuration;

        public OrderController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }
        public IActionResult OrderList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "GetOrders";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }
        public IActionResult AddOrderForm()
        {
            return View();
        }
        public IActionResult OrderDelete(int OrderID)
        {
            try
            {
                string connectionString = this.configuration.GetConnectionString("ConnectionString");

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    using (SqlCommand command = connection.CreateCommand())
                    {
                        command.CommandType = CommandType.StoredProcedure;
                        command.CommandText = "DeleteOrder";
                        command.Parameters.Add("@OrderID", SqlDbType.Int).Value = OrderID;

                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["ErrorMessage"] = "Error deleting product: " + ex.Message;
                // You can also log the error using a logging framework, if available.
                Console.WriteLine(ex.ToString());
            }

            return RedirectToAction("OrderList");
        }
    }
}
