using Microsoft.AspNetCore.Mvc;
using Nice_admin_form___table.Models;
using System.Data.SqlClient;
using System.Data;

namespace Nice_admin_form___table.Controllers
{

    public class ProductController : Controller
    {


        private IConfiguration configuration;

        public ProductController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }



        public IActionResult ProductList()
        {
            string connectionString = configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "GetProducts";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            connection.Close();  // It's a good practice to close the connection when done.

            return View(table);
        }

        public IActionResult AddProductForm()
        {
            return View();
        }

        public IActionResult ProductDelete(int ProductID)
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
                        command.CommandText = "DeleteProduct";
                        command.Parameters.Add("@ProductID", SqlDbType.Int).Value = ProductID;

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

            return RedirectToAction("ProductList");
        }



    }
}
