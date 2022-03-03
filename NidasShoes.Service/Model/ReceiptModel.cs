using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class ReceiptModel
    {
        public int ID { get; set; }
        public int SupplyID { get; set; }
        public int UserID { get; set; }
        public string Note { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
