using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class CardAdminEntity
    {
        public int Id { get; set; }
        public string BankName { get; set; }
        public string CardNumber { get; set; }
        public string CardType { get; set; }
        public string CardHolder { get; set; }
        public string CardBranch { get; set; }
    }
}
