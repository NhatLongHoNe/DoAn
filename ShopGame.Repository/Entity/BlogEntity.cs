using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class BlogEntity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public string MetaTitle { get; set; }
        public int BlogTypeId { get; set; }
        public string BlogTypeName { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
