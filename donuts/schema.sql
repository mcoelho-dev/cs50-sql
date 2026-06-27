CREATE TABLE "ingredients" (
    "id" INTEGER,
    "ingredient" TEXT,
    "price" REAL,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT,
    "type" TEXT DEFAULT "gluten",
    "price" REAL,
    PRIMARY KEY("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "order_number" INTEGER,
    "donuts_order" TEXT,
    "customer" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "customers" (
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "history" INTEGER,
    PRIMARY KEY("id"),
    FOREIGN KEY("history") REFERENCES "orders"("id")
);
