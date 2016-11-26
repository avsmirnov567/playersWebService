namespace PlayerData.Model
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class PlayersContext : DbContext
    {
        public PlayersContext()
            : base("name=PlayersContext")
        {
        }

        public virtual DbSet<Players> Players { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
        }
    }
}
