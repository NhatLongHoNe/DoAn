using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class ReceiptDetailModel
    {
        public int ID { get; set; }
        public int ReceiptID { get; set; }
        public int ProductDetailID { get; set; }
        public int ImportQuantity { get; set; }
        public double ImportPrice { get; set; }

        public string ProductName { get; set; }
        public string ColorName { get; set; }
        public string SizeName { get; set; }
    }
}
