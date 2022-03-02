using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class ReceiptDetailEntity
    {
        public int ID { get; set; }
        public int ReceiptID { get; set; }
        public int ProductDetailID { get; set; }
        public int ImportQuantity { get; set; }
        public double ImportPrice { get; set; }
    }
}
