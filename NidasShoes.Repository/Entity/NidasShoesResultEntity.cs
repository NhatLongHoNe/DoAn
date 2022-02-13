using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class NidasShoesResultEntity<T>
    {
        public List<T> Results { get; set; } = new List<T>();
        public long TotalRecords { get; set; } = 0;
        public int PageCount { get; set; } = 0;
        public int PageSize { get; set; } = 20;
        public int PageNumber { get; set; } = 1;
        public int StatusCode { get; set; } = 200;
        public bool Success { get; set; }
    }
}
