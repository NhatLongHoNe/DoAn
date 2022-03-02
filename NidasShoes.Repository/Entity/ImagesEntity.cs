using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class ImagesEntity
    {
        public int ID { get; set; }
        public int ProductID { get; set; }
        public string Name { get; set; }
        public string Url { get; set; }
    }
}
