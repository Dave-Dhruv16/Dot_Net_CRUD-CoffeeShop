namespace Nice_admin_form___table.Models
{
    public class OrderModel
    {
        public int OrderID { get; set; }
        public DateTime OrderDate { get; set; }
        public int CustomerID { get; set; }
        public string PaymentMode { get; set; }
        public double TotalAmount { get; set; }
        public string ShippingAddress { get; set; }
        public int UserID { get; set; }
    }
}
