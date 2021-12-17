using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class TheSieuReSubmitEntity
    {
        public string telco { get; set; }
        public string code { get; set; }
        public string serial { get; set; }
        public string amount { get; set; }
        public string request_id { get; set; }
        public string partner_id { get; set; }
        public string sign { get; set; }
        public string command { get; set; }
    }
}
