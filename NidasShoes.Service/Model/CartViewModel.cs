using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    [Serializable]
    public class CartViewModel
    {
        public int ProductDetailID { get; set; }
        public ProductDetailClientModel Product { get; set; }
        public int Quantity { set; get; }
        public int DiscoutID { get; set; }
        public double Rate { get; set; }


    }
}
