using System;
using System.Collections.Generic;
using System.Text;

namespace ShopGame.Repository.Entity
{
    public class UserEntity
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string HashedPassword { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public int Balance { get; set; }
        public string Phone { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
