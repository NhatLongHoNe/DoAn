using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Service.Model
{
    public class SlideModel
    {
        public int Id { get; set; }
        public string Image { get; set; }
        public int DisplayOrder { get; set; }
        public string Link { get; set; }
        public string Description { get; set; }
        public DateTime CreatedDate { get; set; }
        public bool Status { get; set; }
    }
}
