using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class ClientSlideEntity
    {
        public int Id { get; set; }
        public string Image { get; set; }
        public string Link { get; set; }
        public string Description { get; set; }
        public bool Status { get; set; }
    }
}
