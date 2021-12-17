using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Service.Model
{
    public class BaseParamModel
    {
        public string Search { get; set; } = "";
        public int PageSize { get; set; } = Int32.MaxValue;
        public int PageNumber { get; set; } = 1;
    }
}
