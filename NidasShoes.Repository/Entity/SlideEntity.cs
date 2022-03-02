using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class SlideEntity
    {
        public int ID { get; set; }
        public string Image { get; set; }
        public int DisplayOrder { get; set; }
        public string Link { get; set; }
        public string Title { get; set; }
        public int Status { get; set; }

    }
}
