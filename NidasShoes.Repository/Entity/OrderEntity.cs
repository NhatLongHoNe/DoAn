using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class OrderEntity
    {
        public int ID { get; set; }
        public int CustomerID { get; set; }
        public int EmployeeID { get; set; }
        public int PaymentID { get; set; }
        public int DiscountID { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Description { get; set; }
        public string Note { get; set; }
        public int OrderStatusID { get; set; }
        public string CustomerName { get; set; }
        public string CustomerMobile { get; set; }
        public string CustomerEmail { get; set; }
        public string CustomerAddress { get; set; }
        public List<OrderDetailEntity> orderDetails { get; set; } = new List<OrderDetailEntity>();
        public OrderStatusEntity OrderStatus { get; set; }
        public string PaymentName { get; set; }
        public string StatusName { get; set; }
        public string EmployeeName { get; set; }


    }
}
