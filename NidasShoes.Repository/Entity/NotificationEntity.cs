using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Repository.Entity
{
    public class NotificationEntity
    {
        public int Id { get; set; }
        public string Content { get; set; }
        public string Image { get; set; }
        public bool Status { get; set; }
    }
}
