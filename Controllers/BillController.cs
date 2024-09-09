using Microsoft.AspNetCore.Mvc;
using Nice_admin_form___table.Models;
using System.Data.SqlClient;
using System.Data;

namespace Nice_admin_form___table.Controllers
{
    public class BillController : Controller
    {

        private IConfiguration configuration;

        public BillController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }


        public IActionResult BillList()
        {
            string connectionString = this.configuration.GetConnectionString("ConnectionString");
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();
            SqlCommand command = connection.CreateCommand();
            command.CommandType = CommandType.StoredProcedure;
            command.CommandText = "GetBills";
            SqlDataReader reader = command.ExecuteReader();
            DataTable table = new DataTable();
            table.Load(reader);
            return View(table);
        }
        public IActionResult AddBillForm()
        {
            return View();
        }

        public IActionResult BillDelete(int BillID)
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
                        command.CommandText = "DeleteBill";
                        command.Parameters.Add("@BillID", SqlDbType.Int).Value = BillID;

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

            return RedirectToAction("BillList");
        }
    }
}
