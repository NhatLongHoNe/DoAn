using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class TheSieuReReturnEntity
    {
        public int status { get; set; }
        public string message { get; set; }
        public int request_id { get; set; }
        public string declared_value { get; set; }
        public string value { get; set; }
        public int amount { get; set; }
        public string code { get; set; }
        public string serial { get; set; }
        public string telco { get; set; }
        public int trans_id { get; set; }
        public string callback_sign { get; set; }
    }
}
