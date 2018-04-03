CREATE TABLE "Configurations"."ApiResources" (
    "Id" BIGSERIAL NOT NULL,
    "Description" VARCHAR(1000) NULL,
    "DisplayName" VARCHAR(200) NULL,
    "Enabled" BOOLEAN NOT NULL,
    "Name" VARCHAR(200) NOT NULL,
    CONSTRAINT "PK_ApiResources" PRIMARY KEY ("Id")
);

CREATE TABLE "Configurations"."Clients" (
    "Id" BIGSERIAL NOT NULL,
    "AbsoluteRefreshTokenLifetime" INT NOT NULL,
    "AccessTokenLifetime" INT NOT NULL,
    "AccessTokenType" INT NOT NULL,
    "AllowAccessTokensViaBrowser" BOOLEAN NOT NULL,
    "AllowOfflineAccess" BOOLEAN NOT NULL,
    "AllowPlainTextPkce" BOOLEAN NOT NULL,
    "AllowRememberConsent" BOOLEAN NOT NULL,
    "AlwaysIncludeUserClaimsInIdToken" BOOLEAN NOT NULL,
    "AlwaysSendClientClaims" BOOLEAN NOT NULL,
    "AuthorizationCodeLifetime" INT NOT NULL,
    "BackChannelLogoutSessionRequired" BOOLEAN NOT NULL,
    "BackChannelLogoutUri" VARCHAR(2000) NULL,
    "ClientClaimsPrefix" VARCHAR(200) NULL,
    "ClientId" VARCHAR(200) NOT NULL,
    "ClientName" VARCHAR(200) NULL,
    "ClientUri" VARCHAR(2000) NULL,
    "ConsentLifetime" INT NULL,
    "Description" VARCHAR(1000) NULL,
    "EnableLocalLogin" BOOLEAN NOT NULL,
    "Enabled" BOOLEAN NOT NULL,
    "FrontChannelLogoutSessionRequired" BOOLEAN NOT NULL,
    "FrontChannelLogoutUri" VARCHAR(2000) NULL,
    "IdentityTokenLifetime" INT NOT NULL,
    "IncludeJwtId" BOOLEAN NOT NULL,
    "LogoUri" VARCHAR(2000) NULL,
    "PairWiseSubjectSalt" VARCHAR(200) NULL,
    "ProtocolType" VARCHAR(200) NOT NULL,
    "RefreshTokenExpiration" INT NOT NULL,
    "RefreshTokenUsage" INT NOT NULL,
    "RequireClientSecret" BOOLEAN NOT NULL,
    "RequireConsent" BOOLEAN NOT NULL,
    "RequirePkce" BOOLEAN NOT NULL,
    "SlidingRefreshTokenLifetime" INT NOT NULL,
    "UpdateAccessTokenClaimsOnRefresh" BOOLEAN NOT NULL,
    CONSTRAINT "PK_Clients" PRIMARY KEY ("Id")
);

CREATE TABLE "Configurations"."IdentityResources" (
    "Id" BIGSERIAL NOT NULL,
    "Description" VARCHAR(1000) NULL,
    "DisplayName" VARCHAR(200) NULL,
    "Emphasize" BOOLEAN NOT NULL,
    "Enabled" BOOLEAN NOT NULL,
    "Name" VARCHAR(200) NOT NULL,
    "Required" BOOLEAN NOT NULL,
    "ShowInDiscoveryDocument" BOOLEAN NOT NULL,
    CONSTRAINT "PK_IdentityResources" PRIMARY KEY ("Id")
);

CREATE TABLE "Configurations"."ApiClaims" (
    "Id" BIGSERIAL NOT NULL,
    "ApiResourceId" BIGINT NOT NULL,
    "Type" VARCHAR(200) NOT NULL,
    CONSTRAINT "PK_ApiClaims" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiClaims_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "Configurations"."ApiResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ApiScopes" (
    "Id" BIGSERIAL NOT NULL,
    "ApiResourceId" BIGINT NOT NULL,
    "Description" VARCHAR(1000) NULL,
    "DisplayName" VARCHAR(200) NULL,
    "Emphasize" BOOLEAN NOT NULL,
    "Name" VARCHAR(200) NOT NULL,
    "Required" BOOLEAN NOT NULL,
    "ShowInDiscoveryDocument" BOOLEAN NOT NULL,
    CONSTRAINT "PK_ApiScopes" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiScopes_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "Configurations"."ApiResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ApiSecrets" (
    "Id" BIGSERIAL NOT NULL,
    "ApiResourceId" BIGINT NOT NULL,
    "Description" VARCHAR(1000) NULL,
    "Expiration" TIMESTAMP NULL,
    "Type" VARCHAR(250) NULL,
    "Value" VARCHAR(2000) NULL,
    CONSTRAINT "PK_ApiSecrets" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiSecrets_ApiResources_ApiResourceId" FOREIGN KEY ("ApiResourceId") REFERENCES "Configurations"."ApiResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientClaims" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "Type" VARCHAR(250) NOT NULL,
    "Value" VARCHAR(250) NOT NULL,
    CONSTRAINT "PK_ClientClaims" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientClaims_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientCorsOrigins" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "Origin" VARCHAR(150) NOT NULL,
    CONSTRAINT "PK_ClientCorsOrigins" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientCorsOrigins_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientGrantTypes" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "GrantType" VARCHAR(250) NOT NULL,
    CONSTRAINT "PK_ClientGrantTypes" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientGrantTypes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientIdPRestrictions" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "Provider" VARCHAR(200) NOT NULL,
    CONSTRAINT "PK_ClientIdPRestrictions" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientIdPRestrictions_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientPostLogoutRedirectUris" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "PostLogoutRedirectUri" VARCHAR(2000) NOT NULL,
    CONSTRAINT "PK_ClientPostLogoutRedirectUris" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientPostLogoutRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientProperties" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "Key" VARCHAR(250) NOT NULL,
    "Value" VARCHAR(2000) NOT NULL,
    CONSTRAINT "PK_ClientProperties" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientProperties_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientRedirectUris" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "RedirectUri" VARCHAR(2000) NOT NULL,
    CONSTRAINT "PK_ClientRedirectUris" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientRedirectUris_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientScopes" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "Scope" VARCHAR(200) NOT NULL,
    CONSTRAINT "PK_ClientScopes" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientScopes_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ClientSecrets" (
    "Id" BIGSERIAL NOT NULL,
    "ClientId" BIGINT NOT NULL,
    "Description" VARCHAR(2000) NULL,
    "Expiration" TIMESTAMP NULL,
    "Type" VARCHAR(250) NULL,
    "Value" VARCHAR(2000) NOT NULL,
    CONSTRAINT "PK_ClientSecrets" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ClientSecrets_Clients_ClientId" FOREIGN KEY ("ClientId") REFERENCES "Configurations"."Clients" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."IdentityClaims" (
    "Id" BIGSERIAL NOT NULL,
    "IdentityResourceId" BIGINT NOT NULL,
    "Type" VARCHAR(200) NOT NULL,
    CONSTRAINT "PK_IdentityClaims" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_IdentityClaims_IdentityResources_IdentityResourceId" FOREIGN KEY ("IdentityResourceId") REFERENCES "Configurations"."IdentityResources" ("Id") ON DELETE CASCADE
);

CREATE TABLE "Configurations"."ApiScopeClaims" (
    "Id" BIGSERIAL NOT NULL,
    "ApiScopeId" BIGINT NOT NULL,
    "Type" VARCHAR(200) NOT NULL,
    CONSTRAINT "PK_ApiScopeClaims" PRIMARY KEY ("Id"),
    CONSTRAINT "FK_ApiScopeClaims_ApiScopes_ApiScopeId" FOREIGN KEY ("ApiScopeId") REFERENCES "Configurations"."ApiScopes" ("Id") ON DELETE CASCADE
);