using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class ProductReviewModel
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int ProductID { get; set; }
        public double Star { get; set; }
        public int Favorite { get; set; }
        public double Rating { get; set; }
        public double Point { get; set; }
    }
}
