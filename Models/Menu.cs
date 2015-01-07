using System;
using System.Collections.Generic;

namespace Potluck.Models
{
    public partial class Menu
    {
        public Menu()
        {
            this.Items = new List<Item>();
        }

        public int menuId { get; set; }
        public string itemName { get; set; }
        public bool isMenuItem { get; set; }
        public int Event_eventId { get; set; }
        public virtual Event Event { get; set; }
        public virtual ICollection<Item> Items { get; set; }
    }
}
