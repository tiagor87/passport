CREATE UNIQUE INDEX "IX_Users_UserName" ON "Passport"."Users" ("UserName");
CREATE UNIQUE INDEX "IX_Users_Email" ON "Passport"."Users" ("Email");
CREATE INDEX "IX_Users_UserName_Password" ON "Passport"."Users" ("UserName", "Password");
