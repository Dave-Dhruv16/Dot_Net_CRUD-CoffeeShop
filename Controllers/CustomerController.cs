using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
using System.Data;

namespace Nice_admin_form___table.Controllers
{
    public class CustomerController : Controller
    {
        private IConfiguration configuration;

        public CustomerController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }
        public IActionResult CustomerList()
        {

            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "GetCustomers";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }
        public IActionResult AddCustomerForm()
        {
            return View();
        }

        public IActionResult CustomerDelete(int CustomerID)
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
                        command.CommandText = "DeleteCustomer";
                        command.Parameters.Add("@CustomerID", SqlDbType.Int).Value = CustomerID;

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

            return RedirectToAction("CustomerList");
        }
    }
}
