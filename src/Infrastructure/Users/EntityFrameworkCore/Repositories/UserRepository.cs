using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using Domain.Users.Models;
using Domain.Users.Repositories;
using Passport.Infrastructure.Common.EntityFrameworkCore;

namespace Passport.Infrastructure.Users.EntityFrameworkCore.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly PassportDbContext context;

        public UserRepository(PassportDbContext context) {
            this.context = context;
        }

        public IEnumerable<User> Get(Expression<Func<User, bool>> expression)
        {
            return this.context.Users.Where(expression);
        }

        public User GetById(long id)
        {
            return this.context.Users.Find(id);
        }
    }
}