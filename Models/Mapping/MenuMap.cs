using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Potluck.Models.Mapping
{
    public class MenuMap : EntityTypeConfiguration<Menu>
    {
        public MenuMap()
        {
            // Primary Key
            this.HasKey(t => t.menuId);

            // Properties
            this.Property(t => t.itemName)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("Menus");
            this.Property(t => t.menuId).HasColumnName("menuId");
            this.Property(t => t.itemName).HasColumnName("itemName");
            this.Property(t => t.isMenuItem).HasColumnName("isMenuItem");
            this.Property(t => t.Event_eventId).HasColumnName("Event_eventId");

            // Relationships
            this.HasRequired(t => t.Event)
                .WithMany(t => t.Menus)
                .HasForeignKey(d => d.Event_eventId);

        }
    }
}
