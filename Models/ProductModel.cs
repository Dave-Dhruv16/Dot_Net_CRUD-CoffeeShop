namespace Nice_admin_form___table.Models
{
    public class ProductModel
    {
        public int ProductID { get; set; }
        public string ProductName { get; set; }
        public decimal ProductPrice { get; set; }
        public string ProductCode { get; set; }
        public string Description { get; set; }
        public int UserID { get; set; }
    }
}

public class UserModel
{
    public int UserID { get; set; }
    public string UserName { get; set; }
}
