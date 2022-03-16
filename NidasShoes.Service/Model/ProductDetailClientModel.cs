using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class ProductDetailClientModel
    {
        public int ID { get; set; }
        public int ProductCategoryID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public int Status { get; set; }
        public string Image { get; set; }
        public double ImportPrice { get; set; }
        public double ExportPrice { get; set; }
        public DateTime CreatedDate { get; set; }
        public string NameProductCategory { get; set; }
        public string DescriptionProductCategory { get; set; }
        public string NameColor { get; set; }
        public string CodeColor { get; set; }
        public string NameSize { get; set; }
        public string Quantity { get; set; }
        public string Manufacturer { get; set; }
    }
}
