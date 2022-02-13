using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class ProductModel
    {
        public int Id { get; set; } = 0;
        public string Code { get; set; } = "";
        public string Name { get; set; } = "";
        public string Image { get; set; } = "/Admin/Content/images/no-image-available-thumb(1349x760-crop).jpg";
        public string Description { get; set; } = "";
        public string Detail { get; set; } = "";
        public int CategoryId { get; set; } = 0;
        public string CategoryName { get; set; } = "";
        public int OrderNo { get; set; } = 0;
        public string Rank { get; set; } = "";
        public string SoTuong { get; set; } = "";
        public string SoTrangPhuc { get; set; } = "";
        public string LoaiTaiKhoan { get; set; } = "";
        public string NoiBat { get; set; } = "";
        public string DangKy { get; set; } = "";
        public string VIP { get; set; } = "";
        public int Top { get; set; } = 0;
        public string AccUserName { get; set; } = "";
        public string AccPassword { get; set; } = "";
        public string MetaTitle { get; set; } = "";
        public string MetaDescription { get; set; } = "";
        public bool Status { get; set; } = true;
        public double Price { get; set; } = 0;
        public List<ProductImageModel> ProductImage { get; set; } = new List<ProductImageModel>();
    }
}
