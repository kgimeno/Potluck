using System;
using System.Collections.Generic;

namespace Potluck.Models
{
    public partial class Item
    {
        public Item()
        {
            this.UserItems = new List<UserItem>();
        }

        public int itemId { get; set; }
        public string itemName { get; set; }
        public int Menu_menuId { get; set; }
        public virtual ICollection<UserItem> UserItems { get; set; }
        public virtual Menu Menu { get; set; }
    }
}
