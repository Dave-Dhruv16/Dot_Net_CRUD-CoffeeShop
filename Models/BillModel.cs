using System.ComponentModel.DataAnnotations;

namespace Nice_admin_form___table.Models
{
    public class BillModel
    {
        [Required(ErrorMessage = "This field can not be Empty")]
        [Range(1, 10)]
        public int BillID { get; set; }
        public string BillNumber { get; set; }
        public DateTime BillDate { get; set; }
        public int OrderID { get; set; }
        public double TotalAmount { get; set; }
        public double Discount { get; set; }
        public double NetAmount { get; set; }
        public int UserID { get; set; }
    }
}
