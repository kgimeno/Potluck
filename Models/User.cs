using System;
using System.Collections.Generic;

namespace Potluck.Models
{
    public partial class User
    {
        public User()
        {
            this.EventUsers = new List<EventUser>();
            this.UserItems = new List<UserItem>();
        }

        public int userId { get; set; }
        public string lastName { get; set; }
        public string firstName { get; set; }
        public string email { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public bool isPlanner { get; set; }
        public virtual ICollection<EventUser> EventUsers { get; set; }
        public virtual ICollection<UserItem> UserItems { get; set; }
    }
}
