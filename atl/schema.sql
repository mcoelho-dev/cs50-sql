CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "age" INTEGER,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "date" TEXT,
    "flight" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT,
    "concourse" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "flight_id" INTEGER,
    "airline_id" INTEGER,
    "airport_code_depart" TEXT,
    "airport_code_heading" TEXT,
    "departure_date" TEXT,
    "arrival_date" TEXT,
    FOREIGN KEY("flight_id") REFERENCES "check_ins"("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
