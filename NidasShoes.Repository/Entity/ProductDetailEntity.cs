using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class ProductDetailEntity
    {
        public int ID { get; set; }
        public int ProductID { get; set; }
        public int SizeID { get; set; }
        public int ColorID { get; set; }
        public int Quantity { get; set; }
        public string Image { get; set; }
    }
}
