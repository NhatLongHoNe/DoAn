using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class BlogModel
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Image { get; set; } = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
        public string Description { get; set; }
        public string MetaTitle { get; set; }
        public int BlogTypeId { get; set; }
        public string BlogTypeName { get; set; }
    }
}
