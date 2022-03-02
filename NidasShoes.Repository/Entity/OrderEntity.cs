using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class OrderEntity
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int PaymentID { get; set; }
        public int DiscountID { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Description { get; set; }
        public string Note { get; set; }
        public int OrderStatusID { get; set; }
    }
}
