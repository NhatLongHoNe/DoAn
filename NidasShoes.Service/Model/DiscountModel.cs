using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class DiscountModel
    {
        public int ID { get; set; } = 0;
        public string Code { get; set; } = "";
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int Rate { get; set; } = 0;
        public string Description { get; set; } = "";
    }
}
