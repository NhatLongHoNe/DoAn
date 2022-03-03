using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class ProductPriceModel
    {
        public int ID { get; set; }
        public int ProductDetailID { get; set; }
        public double ImportPrice { get; set; }
        public double ExportPrice { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
