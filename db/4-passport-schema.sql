CREATE TABLE "Passport"."Users" (
    "Id" BIGSERIAL NOT NULL,
    "IsActive" BOOLEAN NOT NULL DEFAULT(TRUE),
    "UserName" VARCHAR(20) NOT NULL,
    "Email" VARCHAR(255) NOT NULL,
    "Password" VARCHAR(100) NOT NULL,
    "Gender" INT,
    "Birthday" TIMESTAMP,
    "GivenName" VARCHAR(50),
    "SurName" VARCHAR(50),
    "Name" VARCHAR(100),
    "PostalCode" VARCHAR(10),
    "State" VARCHAR(50),
    "StreetAddress" VARCHAR(255),
    "Thumbprint" VARCHAR(255),
    CONSTRAINT "PK_Users" PRIMARY KEY ("Id")
);