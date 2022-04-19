using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class OrderModel
    {
        public int ID { get; set; }
        public int CustomerID { get; set; }
        public int EmployeeID { get; set; }
        public int PaymentID { get; set; }
        public int DiscountID { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Description { get; set; }
        public string Note { get; set; } = "";
        public int OrderStatusID { get; set; }
        public string CustomerName { get; set; }
        public string CustomerMobile { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerAddress { get; set; }

        public List<OrderDetailModel> OrderDetails { get; set; } = new List<OrderDetailModel>();
        public string StatusName { get; set; }
        public string PaymentName { get; set; }
        public string EmployeeName { get; set; }
        public double TotalCost { get; set; }
        public DateTime ModifyDate { get; set; }
        public string Code { get; set; }


    }
}
