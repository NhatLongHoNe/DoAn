using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Service.Model
{
    public class AccountModel
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string HashedPassword { get; set; }
    }
}
