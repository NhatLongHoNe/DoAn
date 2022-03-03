using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class DiscountEntity
    {
        public int ID { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public int Rate { get; set; }
        public string Description { get; set; }
    }
}
