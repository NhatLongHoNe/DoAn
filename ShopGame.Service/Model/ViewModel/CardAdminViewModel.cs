﻿using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Service.Model.ViewModel
{
    public class CardAdminViewModel
    {
        public int Id { get; set; }
        public string BankName { get; set; }
        public string CardNumber { get; set; }
        public string CardType { get; set; }
        public string CardHolder { get; set; }
        public string CardBranch { get; set; }
    }
}
