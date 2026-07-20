CREATE VIEW "one_bedrooms" AS
    SELECT "id", "property type", "host_name", "accommodates" FROM "listings"
    WHERE "bedrooms" = 1
;
