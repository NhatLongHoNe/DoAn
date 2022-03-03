using System;
using System.Collections.Generic;
using System.Text;

namespace NidasShoes.Service.Model
{
    public class UserModel
    {
        public int Id { get; set; }
        public int RuleID { get; set; }
        public string UserName { get; set; }
        public string HashedPassword { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string  Phone { get; set; }
    }
}
