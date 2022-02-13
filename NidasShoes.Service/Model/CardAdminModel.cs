using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class CardAdminModel
    {
        public int Id { get; set; }
        public string BankName { get; set; }
        public string CardNumber { get; set; }
        public string CardType { get; set; }
        public string CardHolder { get; set; }
        public string CardBranch { get; set; }
    }
}
