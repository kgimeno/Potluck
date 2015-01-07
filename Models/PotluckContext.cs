using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using Potluck.Models.Mapping;

namespace Potluck.Models
{
    public partial class PotluckContext : DbContext
    {
        static PotluckContext()
        {
            Database.SetInitializer<PotluckContext>(null);
        }

        public PotluckContext()
            : base("Name=PotluckContext")
        {
        }

        public DbSet<Event> Events { get; set; }
        public DbSet<EventUser> EventUsers { get; set; }
        public DbSet<Item> Items { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<UserItem> UserItems { get; set; }
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Configurations.Add(new EventMap());
            modelBuilder.Configurations.Add(new EventUserMap());
            modelBuilder.Configurations.Add(new ItemMap());
            modelBuilder.Configurations.Add(new MenuMap());
            modelBuilder.Configurations.Add(new UserItemMap());
            modelBuilder.Configurations.Add(new UserMap());
        }
    }
}
