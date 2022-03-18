﻿using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class ProductModel
    {
        public int ID { get; set; }
        public int ProductCategoryID { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public bool Status { get; set; }
        public string Image { get; set; }
        public double ExportPrice { get; set; }
        public DateTime CreatedDate { get; set; }
        public string Manufacturer { get; set; }
        public string CatagoryName { get; set; }
        public List<ProductImageModel> ProductImage { get; set; } = new List<ProductImageModel>();
        
    }
}
