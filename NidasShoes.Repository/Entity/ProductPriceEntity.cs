using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class ProductPriceEntity
    {
        public int ID { get; set; }
        public int ProductDetailID { get; set; }
        public double ImportPrice { get; set; }
        public double ExportPrice { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
