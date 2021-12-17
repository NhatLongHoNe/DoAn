using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class BaseParamEntity
    {
        public string Search { get; set; }
        public int PageSize { get; set; }
        public int PageNumber { get; set; }
    }
}
