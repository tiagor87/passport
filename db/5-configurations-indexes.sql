CREATE INDEX "IX_ApiClaims_ApiResourceId" ON "Configurations"."ApiClaims" ("ApiResourceId");
CREATE UNIQUE INDEX "IX_ApiResources_Name" ON "Configurations"."ApiResources" ("Name");
CREATE INDEX "IX_ApiScopeClaims_ApiScopeId" ON "Configurations"."ApiScopeClaims" ("ApiScopeId");
CREATE INDEX "IX_ApiScopes_ApiResourceId" ON "Configurations"."ApiScopes" ("ApiResourceId");
CREATE UNIQUE INDEX "IX_ApiScopes_Name" ON "Configurations"."ApiScopes" ("Name");
CREATE INDEX "IX_ApiSecrets_ApiResourceId" ON "Configurations"."ApiSecrets" ("ApiResourceId");
CREATE INDEX "IX_ClientClaims_ClientId" ON "Configurations"."ClientClaims" ("ClientId");
CREATE INDEX "IX_ClientCorsOrigins_ClientId" ON "Configurations"."ClientCorsOrigins" ("ClientId");
CREATE INDEX "IX_ClientGrantTypes_ClientId" ON "Configurations"."ClientGrantTypes" ("ClientId");
CREATE INDEX "IX_ClientIdPRestrictions_ClientId" ON "Configurations"."ClientIdPRestrictions" ("ClientId");
CREATE INDEX "IX_ClientPostLogoutRedirectUris_ClientId" ON "Configurations"."ClientPostLogoutRedirectUris" ("ClientId");
CREATE INDEX "IX_ClientProperties_ClientId" ON "Configurations"."ClientProperties" ("ClientId");
CREATE INDEX "IX_ClientRedirectUris_ClientId" ON "Configurations"."ClientRedirectUris" ("ClientId");
CREATE UNIQUE INDEX "IX_Clients_ClientId" ON "Configurations"."Clients" ("ClientId");
CREATE INDEX "IX_ClientScopes_ClientId" ON "Configurations"."ClientScopes" ("ClientId");
CREATE INDEX "IX_ClientSecrets_ClientId" ON "Configurations"."ClientSecrets" ("ClientId");
CREATE INDEX "IX_IdentityClaims_IdentityResourceId" ON "Configurations"."IdentityClaims" ("IdentityResourceId");
CREATE UNIQUE INDEX "IX_IdentityResources_Name" ON "Configurations"."IdentityResources" ("Name");