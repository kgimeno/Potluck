using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Potluck.Models.Mapping
{
    public class ItemMap : EntityTypeConfiguration<Item>
    {
        public ItemMap()
        {
            // Primary Key
            this.HasKey(t => t.itemId);

            // Properties
            this.Property(t => t.itemName)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("Items");
            this.Property(t => t.itemId).HasColumnName("itemId");
            this.Property(t => t.itemName).HasColumnName("itemName");
            this.Property(t => t.Menu_menuId).HasColumnName("Menu_menuId");

            // Relationships
            this.HasRequired(t => t.Menu)
                .WithMany(t => t.Items)
                .HasForeignKey(d => d.Menu_menuId);

        }
    }
}
