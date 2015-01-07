using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Potluck.Models.Mapping
{
    public class EventMap : EntityTypeConfiguration<Event>
    {
        public EventMap()
        {
            // Primary Key
            this.HasKey(t => t.eventId);

            // Properties
            this.Property(t => t.eventName)
                .IsRequired();

            this.Property(t => t.eventStreetAddr)
                .IsRequired();

            this.Property(t => t.eventCity)
                .IsRequired();

            this.Property(t => t.eventState)
                .IsRequired();

            this.Property(t => t.eventZip)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("Events");
            this.Property(t => t.eventId).HasColumnName("eventId");
            this.Property(t => t.eventName).HasColumnName("eventName");
            this.Property(t => t.eventDate).HasColumnName("eventDate");
            this.Property(t => t.eventStreetAddr).HasColumnName("eventStreetAddr");
            this.Property(t => t.eventCity).HasColumnName("eventCity");
            this.Property(t => t.eventState).HasColumnName("eventState");
            this.Property(t => t.eventZip).HasColumnName("eventZip");
        }
    }
}
