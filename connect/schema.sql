CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "password" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "educations" (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT
    "location" TEXT,
    "year" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "connections" (
    "following_user" INTEGER,
    "school_affiliation" INTEGER,
    "school_start_date" TEXT,
    "school_end_date" TEXT,
    "degree_type" TEXT,
    "company_affiliation" INTEGER,
    "company_start_date" TEXT,
    "company_end_date" TEXT,
    "company_title" TEXT,
    FOREIGN KEY("following_user") REFERENCES "users"("id"),
    FOREIGN KEY("school_affiliation") REFERENCES "educations"("id"),
    FOREIGN KEY("company_affiliation") REFERENCES "companies"("id")
);
