using System;
using System.Collections.Generic;

namespace Potluck.Models
{
    public partial class UserItem
    {
        public int userItemId { get; set; }
        public int Item_itemId { get; set; }
        public int User_userId { get; set; }
        public virtual Item Item { get; set; }
        public virtual User User { get; set; }
    }
}
