using Domain.Users.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace Passport.Infrastructure.Users.EntityFrameworkCore.Configurations
{
    public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder
                .ToTable("Users")
                .HasKey(u => u.Id);
            builder
                .Property(u => u.Email)
                .IsRequired();
            builder
                .Property(u => u.UserName)
                .IsRequired();
            builder
                .Property(u => u.Password)
                .HasField("password")
                .IsRequired();
        }
    }
}