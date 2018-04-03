using Domain.Users.Models;
using Microsoft.EntityFrameworkCore;
using Passport.Infrastructure.Users.EntityFrameworkCore.Configurations;

namespace Passport.Infrastructure.Common.EntityFrameworkCore
{
    public class PassportDbContext : DbContext {
        public PassportDbContext(DbContextOptions<PassportDbContext> options) : base(options) {
        }

        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder) {
            modelBuilder.HasDefaultSchema("Passport");
            modelBuilder.ApplyConfiguration(new UserConfiguration());
        }
    }
}