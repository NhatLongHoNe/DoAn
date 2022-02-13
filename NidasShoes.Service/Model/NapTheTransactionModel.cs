using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class NapTheTransactionModel
    {
        public int Id { get; set; }
        public int NCCId { get; set; }
        public int GiaTriTheId { get; set; }
        public string MaThe { get; set; }
        public string Name { get; set; }
        public string Serial { get; set; }
        public double ThucNhan { get; set; }
        public string KieuNap { get; set; }
        public int UserId { get; set; }
        public int Status { get; set; }
        public int OutIn { get; set; }
        public string TenNCC { get; set; }
        public string TenGTT { get; set; }
        public double Value { get; set; }
        public double Percent { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
