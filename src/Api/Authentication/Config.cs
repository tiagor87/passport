using System.Collections.Generic;
using Domain.Users.Models;
using IdentityServer4.Models;
using IdentityServer4.Test;

namespace Passport.Api.Authentication
{
    public class Config {
        public static List<User> Users = new List<User> {
            new User("user", "password", "user@email.com")
        };

        public static IEnumerable<Client> Clients = new List<Client>
        {
            new Client
            {
                ClientId = "api",
                ClientSecrets = new List<Secret> {
                    new Secret("api_secret".Sha256())
                },
                AllowedGrantTypes = GrantTypes.CodeAndClientCredentials,
                AllowedScopes = { "api" }
            },
            new Client
            {
                ClientId = "spa",
                ClientSecrets = new List<Secret> {
                    new Secret("spa_secret".Sha256())
                },
                AllowedGrantTypes = GrantTypes.ResourceOwnerPasswordAndClientCredentials,
                AllowedScopes = { "api", "profile", "email" }
            },
        };

        public static IEnumerable<IdentityResource> IdentityResources = new List<IdentityResource>
        {
            new IdentityResources.Profile(),
            new IdentityResources.Email(),
        };

        public static IEnumerable<ApiResource> Apis = new List<ApiResource>
        {
            new ApiResource("api", "API")
        };
    }
}