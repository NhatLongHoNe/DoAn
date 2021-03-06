using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class FeedBackModel
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public string Title { get; set; }
        public string Content { get; set; }
        public DateTime CreatedDate { get; set; }
        public int ParentFBID { get; set; }
    }
}
