using Microsoft.AspNetCore.Mvc;
using Nice_admin_form___table.Models;
using System.Data.SqlClient;
using System.Data;

namespace Nice_admin_form___table.Controllers
{
    public class ProductController : Controller
    {
        private readonly IConfiguration configuration;

        public ProductController(IConfiguration _configuration)
        {
            configuration = _configuration;
        }

        // Display the product list
        public IActionResult ProductList()
        {
            List<ProductModel> productList = new List<ProductModel>();

            string connectionString = configuration.GetConnectionString("ConnectionString");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "GetProducts";  // Procedure to get all products
                SqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    productList.Add(new ProductModel
                    {
                        ProductID = (int)reader["ProductID"],
                        ProductName = reader["ProductName"].ToString(),
                        ProductPrice = (decimal)reader["ProductPrice"],
                        ProductCode = reader["ProductCode"].ToString(),
                        Description = reader["Description"].ToString(),
                        UserID = (int)reader["UserID"]
                    });
                }
            }

            return View(productList);  // Pass the product list to the view
        }

        // Add/Edit form view
        public IActionResult AddEditProductForm(int? ProductID)
        {
            ProductModel product = new ProductModel();
            List<UserModel> users = new List<UserModel>();

            // Fetch Users for Dropdown
            string connectionString = configuration.GetConnectionString("ConnectionString");
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand userCommand = new SqlCommand("SELECT UserID, UserName FROM dbo.New_User", connection);
                SqlDataReader userReader = userCommand.ExecuteReader();
                while (userReader.Read())
                {
                    users.Add(new UserModel
                    {
                        UserID = (int)userReader["UserID"],
                        UserName = userReader["UserName"].ToString()
                    });
                }
            }
            ViewBag.Users = users;  // Pass users to the view for the dropdown

            if (ProductID.HasValue)
            {
                // Editing an existing product
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = connection.CreateCommand();
                    command.CommandType = CommandType.StoredProcedure;
                    command.CommandText = "GetProducts";  // Fetch product by ID
                    command.Parameters.AddWithValue("@ProductID", ProductID);
                    SqlDataReader reader = command.ExecuteReader();
                    if (reader.Read())
                    {
                        product.ProductID = (int)reader["ProductID"];
                        product.ProductName = reader["ProductName"].ToString();
                        product.ProductPrice = (decimal)reader["ProductPrice"];
                        product.ProductCode = reader["ProductCode"].ToString();
                        product.Description = reader["Description"].ToString();
                        product.UserID = (int)reader["UserID"];
                    }
                }
            }

            return View("AddEditProduct", product);
        }

        // Save product (Insert or Update)
        [HttpPost]
        public IActionResult SaveProduct(ProductModel product)
        {
            string connectionString = configuration.GetConnectionString("ConnectionString");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;

                if (product.ProductID > 0)
                {
                    command.CommandText = "UpdateProduct";  // Update existing product
                    command.Parameters.AddWithValue("@ProductID", product.ProductID);
                }
                else
                {
                    command.CommandText = "InsertProduct";  // Insert new product
                }

                command.Parameters.AddWithValue("@ProductName", product.ProductName);
                command.Parameters.AddWithValue("@ProductPrice", product.ProductPrice);
                command.Parameters.AddWithValue("@ProductCode", product.ProductCode);
                command.Parameters.AddWithValue("@Description", product.Description);
                command.Parameters.AddWithValue("@UserID", product.UserID);

                command.ExecuteNonQuery();
            }

            return RedirectToAction("ProductList");
        }

        // Delete product
        public IActionResult ProductDelete(int ProductID)
        {
            string connectionString = configuration.GetConnectionString("ConnectionString");

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = connection.CreateCommand();
                command.CommandType = CommandType.StoredProcedure;
                command.CommandText = "DeleteProduct";
                command.Parameters.AddWithValue("@ProductID", ProductID);
                command.ExecuteNonQuery();
            }

            return RedirectToAction("ProductList");
        }
    }
}
