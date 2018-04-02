using System;
using System.Threading.Tasks;
using IdentityServer4.Models;
using IdentityServer4.Validation;
using Passport.Application.Users;

namespace Passport.Api.Authentication
{
    public class ResourceOwnerPasswordValidator : IResourceOwnerPasswordValidator
    {
        private readonly IUserAppService userAppService;

        public ResourceOwnerPasswordValidator(IUserAppService userAppService) {
            this.userAppService = userAppService;
        }
        public async Task ValidateAsync(ResourceOwnerPasswordValidationContext context)
        {
            try
            {
                var user = await this.userAppService.GetByEmailAndPasswordAsync(context.UserName, context.Password);
                if (user != null)
                {
                    context.Result = new GrantValidationResult(user.Id.ToString(), "custom", this.userAppService.GetClaimsByUser(user));
                    return;
                }
                context.Result = new GrantValidationResult(TokenRequestErrors.InvalidGrant, "Invalid username or password.");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                context.Result = new GrantValidationResult(TokenRequestErrors.InvalidGrant, "Invalid username or password");
            }
        }
    }
}