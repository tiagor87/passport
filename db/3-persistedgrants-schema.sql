CREATE TABLE "PersistedGrants"."PersistedGrants" (
    "Key" VARCHAR(200) NOT NULL,
    "ClientId" VARCHAR(200) NOT NULL,
    "CreationTime" TIMESTAMP NOT NULL,
    "Data" VARCHAR(7000) NOT NULL,
    "Expiration" TIMESTAMP NULL,
    "SubjectId" VARCHAR(200) NULL,
    "Type" VARCHAR(50) NOT NULL,
    CONSTRAINT "PK_PersistedGrants" PRIMARY KEY ("Key")
);