using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using Domain.Users.Models;

namespace Domain.Users.Repositories
{
    public interface IUserRepository
    {
        User GetById(long id);
        IEnumerable<User> Get(Expression<Func<User, bool>> expression);
    }
}