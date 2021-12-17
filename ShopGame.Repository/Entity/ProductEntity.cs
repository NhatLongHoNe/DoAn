using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class ProductEntity
    {
        public int Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }
        public string Detail { get; set; }
        public int CategoryId { get; set; }
        public String CategoryName { get; set; }
        public int OrderNo { get; set; }
        public string Rank { get; set; }
        public string SoTuong { get; set; }
        public string SoTrangPhuc { get; set; }
        public string LoaiTaiKhoan { get; set; }
        public string NoiBat { get; set; }
        public string DangKy { get; set; }
        public string VIP { get; set; }
        public int Top { get; set; }
        public string AccUserName { get; set; }
        public string AccPassword { get; set; }
        public string MetaTitle { get; set; }
        public string MetaDescription { get; set; }
        public bool Status { get; set; }
        public double Price { get; set; }
        public List<ProductImageEntity> ProductImage { get; set; } = new List<ProductImageEntity>();
    }
}
