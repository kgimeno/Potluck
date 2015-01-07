using System;
using System.Collections.Generic;

namespace Potluck.Models
{
    public partial class EventUser
    {
        public int eventUserId { get; set; }
        public int Event_eventId { get; set; }
        public int User_userId { get; set; }
        public virtual Event Event { get; set; }
        public virtual User User { get; set; }
    }
}
