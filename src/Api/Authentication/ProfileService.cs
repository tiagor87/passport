using System;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Domain.Users.Models;
using IdentityServer4.Models;
using IdentityServer4.Services;
using Passport.Application.Users;

namespace Passport.Api.Authentication
{
    public class ProfileService : IProfileService
    {
        private readonly IUserAppService userAppService;

        public ProfileService(IUserAppService userAppService) {
            this.userAppService = userAppService;
        }

        public async Task GetProfileDataAsync(ProfileDataRequestContext context)
        {
            try
            {
                User user = null;
                //depending on the scope accessing the user data.
                if (!string.IsNullOrEmpty(context.Subject.Identity.Name))
                {
                    //get user from db (in my case this is by email)
                    user = await userAppService.GetByUserNameAsync(context.Subject.Identity.Name);
                }
                else
                {
                    //get subject from context (this was set ResourceOwnerPasswordValidator.ValidateAsync),
                    //where and subject was set to my user id.
                    var userId = context.Subject.Claims.FirstOrDefault(x => x.Type.Equals(ClaimTypes.Sid));

                    if (!string.IsNullOrWhiteSpace(userId?.Value) && long.Parse(userId.Value) > 0)
                    {
                        //get user from db (find user by user id)
                        user = await this.userAppService.GetByIdAsync(long.Parse(userId.Value));        
                    }
                }

                if (user != null)
                {
                    var claims = this.userAppService.GetClaimsByUser(user);
                    context.IssuedClaims = claims.Where(x => context.RequestedClaimTypes.Contains(x.Type)).ToList();
                }
            }
            catch
            {
                //log your error
            }
        }

        public async Task IsActiveAsync(IsActiveContext context)
        {
            try
            {
                //get subject from context (set in ResourceOwnerPasswordValidator.ValidateAsync),
                var userId = context.Subject.Claims.FirstOrDefault(x => x.Type.Equals(ClaimTypes.Sid));

                if (!string.IsNullOrEmpty(userId?.Value) && long.Parse(userId.Value) > 0)
                {
                    var user = await this.userAppService.GetByIdAsync(long.Parse(userId.Value));

                    if (user != null)
                    {
                        context.IsActive = user.IsActive;
                    }
                }
            }
            catch
            {
                //handle error logging
            }
        }
    }
}