using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using Domain.Users.Models;

namespace Passport.Application.Users
{
    public interface IUserAppService
    {
        Task<User> GetByEmailAndPasswordAsync(string userName, string password);
        User GetByEmailAndPassword(string userName, string password);
        Task<User> GetByUserNameAsync(string userName);
        User GetByUserName(string userName);
        Task<User> GetByIdAsync(long userId);
        User GetById(long userId);
        Task<IEnumerable<Claim>> GetClaimsByUserIdAsync(long userId);
        IEnumerable<Claim> GetClaimsByUserId(long userId);
        IEnumerable<Claim> GetClaimsByUser(User user); 
    }
}