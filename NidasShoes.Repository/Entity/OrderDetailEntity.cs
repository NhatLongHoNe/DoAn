using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class OrderDetailEntity
    {
        public int ID { get; set; }
        public int OrderID { get; set; }
        public int ProductDetailID { get; set; }
        public double Price { get; set; }
        public int Quantity { get; set; }
    }
}
