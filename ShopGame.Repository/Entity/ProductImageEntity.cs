using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class ProductImageEntity
    {
        public int Id { get; set; }
        public int ProductId { get; set; }
        public string Image { get; set; }
    }
}
