using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Service.Model.ViewModel
{
    public class SkinCategoryViewModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public int SkinsSold { get; set; }
    }
}
