using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class ProductCategoryModel
    {
        public int ID { get; set; }
        public int ParentID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public int Status { get; set; }
    }
}
