using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Service.Model.ViewModel
{
    public class SkinViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public int SkinCategoryId { get; set; }
        public string SkinCategoryName { get; set; }
        public double Price { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
