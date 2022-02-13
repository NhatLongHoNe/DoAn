using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class TheSieuReSubmitModel
    {
        public string telco { get; set; }
        public string code { get; set; }
        public string serial { get; set; }
        public int amount { get; set; }
        public string request_id { get; set; }
        public string partner_id { get; set; }
        public string sign { get; set; }
        public string command { get; set; }
    }
}
