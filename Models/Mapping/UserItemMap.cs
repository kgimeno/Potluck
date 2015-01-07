using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Potluck.Models.Mapping
{
    public class UserItemMap : EntityTypeConfiguration<UserItem>
    {
        public UserItemMap()
        {
            // Primary Key
            this.HasKey(t => t.userItemId);

            // Properties
            // Table & Column Mappings
            this.ToTable("UserItems");
            this.Property(t => t.userItemId).HasColumnName("userItemId");
            this.Property(t => t.Item_itemId).HasColumnName("Item_itemId");
            this.Property(t => t.User_userId).HasColumnName("User_userId");

            // Relationships
            this.HasRequired(t => t.Item)
                .WithMany(t => t.UserItems)
                .HasForeignKey(d => d.Item_itemId);
            this.HasRequired(t => t.User)
                .WithMany(t => t.UserItems)
                .HasForeignKey(d => d.User_userId);

        }
    }
}
