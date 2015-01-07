using System;
using System.Collections.Generic;

namespace Potluck.Models
{
    public partial class Event
    {
        public Event()
        {
            this.EventUsers = new List<EventUser>();
            this.Menus = new List<Menu>();
        }

        public int eventId { get; set; }
        public string eventName { get; set; }
        public System.DateTime eventDate { get; set; }
        public string eventStreetAddr { get; set; }
        public string eventCity { get; set; }
        public string eventState { get; set; }
        public string eventZip { get; set; }
        public virtual ICollection<EventUser> EventUsers { get; set; }
        public virtual ICollection<Menu> Menus { get; set; }
    }
}
