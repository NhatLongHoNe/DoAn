using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class TransactionEntity
    {
        public int Id { get; set; }
        public string GiaoDich { get; set; }
        public double SoTien { get; set; }
        public double SoDu { get; set; }
        public string Content { get; set; }
        public bool Status { get; set; }
        public string TheCao { get; set; }
        public string LoaiThe { get; set; }
        public string KieuNap { get; set; }
        public string MaThe { get; set; }
        public int TransactionCategoryTypeId { get; set; }
        public int UserId { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
