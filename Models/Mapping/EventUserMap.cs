using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Potluck.Models.Mapping
{
    public class EventUserMap : EntityTypeConfiguration<EventUser>
    {
        public EventUserMap()
        {
            // Primary Key
            this.HasKey(t => t.eventUserId);

            // Properties
            // Table & Column Mappings
            this.ToTable("EventUsers");
            this.Property(t => t.eventUserId).HasColumnName("eventUserId");
            this.Property(t => t.Event_eventId).HasColumnName("Event_eventId");
            this.Property(t => t.User_userId).HasColumnName("User_userId");

            // Relationships
            this.HasRequired(t => t.Event)
                .WithMany(t => t.EventUsers)
                .HasForeignKey(d => d.Event_eventId);
            this.HasRequired(t => t.User)
                .WithMany(t => t.EventUsers)
                .HasForeignKey(d => d.User_userId);

        }
    }
}
