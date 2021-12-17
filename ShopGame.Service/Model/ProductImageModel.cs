using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Service.Model
{
    public class ProductImageModel
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public string Image { get; set; }
    }
}
