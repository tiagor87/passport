using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Domain.Users.Models;
using Domain.Users.Repositories;

namespace Passport.Application.Users
{
    public class UserAppService : IUserAppService
    {
        private readonly IUserRepository userRepository;

        public UserAppService(IUserRepository userRepository) {
            this.userRepository = userRepository;
        }

        public User GetByEmailAndPassword(string userName, string password)
        {
            return this.userRepository.Get(u => u.UserName.Equals(userName) && u.Password.Equals(User.Criptography(password))).FirstOrDefault();
        }

        public Task<User> GetByEmailAndPasswordAsync(string userName, string password)
        {
            return Task.Factory.StartNew(() => this.GetByEmailAndPassword(userName, password));
        }

        public User GetById(long userId)
        {
            return this.userRepository.GetById(userId);
        }

        public Task<User> GetByIdAsync(long userId)
        {
            return Task.Factory.StartNew(() => this.GetById(userId));
        }

        public User GetByUserName(string userName)
        {
            return this.userRepository.Get(u => u.UserName.Equals(userName)).FirstOrDefault();
        }

        public Task<User> GetByUserNameAsync(string userName)
        {
            return Task.Factory.StartNew(() => this.GetByUserName(userName));
        }

        public IEnumerable<Claim> GetClaimsByUser(User user)
        {
            return new List<Claim> {
                new Claim(ClaimTypes.Sid, user.Id.ToString()),
                new Claim(ClaimTypes.Email, user.Email),
                new Claim(ClaimTypes.DateOfBirth, user.Birthday?.ToString("yyyy-MM-dd") ?? string.Empty),
                new Claim(ClaimTypes.Gender, user.Gender.ToString()),
                new Claim(ClaimTypes.GivenName, user.GivenName ?? string.Empty),
                new Claim(ClaimTypes.Surname, user.SurName ?? string.Empty),
                new Claim(ClaimTypes.Name, user.Name ?? string.Empty),
                new Claim(ClaimTypes.PostalCode, user.PostalCode ?? string.Empty),
                new Claim(ClaimTypes.StateOrProvince, user.State ?? string.Empty),
                new Claim(ClaimTypes.StreetAddress, user.StreetAddress ?? string.Empty),
                new Claim(ClaimTypes.Thumbprint, user.Thumbprint ?? string.Empty)
            };
        }

        public IEnumerable<Claim> GetClaimsByUserId(long userId)
        {
            var user = this.GetById(userId);
            return this.GetClaimsByUser(user);
        }

        public Task<IEnumerable<Claim>> GetClaimsByUserIdAsync(long userId)
        {
            return Task.Factory.StartNew(() => this.GetClaimsByUserId(userId));
        }
    }
}