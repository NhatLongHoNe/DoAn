using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class ProductImageEntity
    {
        public int ID { get; set; }
        public int ProductID { get; set; }
        public string Image { get; set; }
    }
}
