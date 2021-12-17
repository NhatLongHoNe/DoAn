using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class ProductTransactionEntity
    {
        public int Id { get; set; }
        public int ProductType { get; set; }
        public string Name { get; set; }
        public string AccUserName { get; set; }
        public string AccPassword { get; set; }
        public double Price { get; set; }
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string IdGame { get; set; }
        public double EndBalance { get; set; }
        public string Content { get; set; }
        public int Status { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
