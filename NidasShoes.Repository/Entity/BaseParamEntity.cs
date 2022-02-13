using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class BaseParamEntity
    {
        public string Search { get; set; }
        public int PageSize { get; set; }
        public int PageNumber { get; set; }
    }
}
