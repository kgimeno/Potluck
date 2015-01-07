using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity.ModelConfiguration;

namespace Potluck.Models.Mapping
{
    public class UserMap : EntityTypeConfiguration<User>
    {
        public UserMap()
        {
            // Primary Key
            this.HasKey(t => t.userId);

            // Properties
            this.Property(t => t.lastName)
                .IsRequired();

            this.Property(t => t.firstName)
                .IsRequired();

            this.Property(t => t.email)
                .IsRequired();

            this.Property(t => t.username)
                .IsRequired();

            this.Property(t => t.password)
                .IsRequired();

            // Table & Column Mappings
            this.ToTable("Users");
            this.Property(t => t.userId).HasColumnName("userId");
            this.Property(t => t.lastName).HasColumnName("lastName");
            this.Property(t => t.firstName).HasColumnName("firstName");
            this.Property(t => t.email).HasColumnName("email");
            this.Property(t => t.username).HasColumnName("username");
            this.Property(t => t.password).HasColumnName("password");
            this.Property(t => t.isPlanner).HasColumnName("isPlanner");
        }
    }
}
