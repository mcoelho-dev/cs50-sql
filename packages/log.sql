
-- *** The Lost Letter ***
SELECT * FROM "addresses"
   ...> WHERE "address" = '900 Somerville Avenue'; -- first checking the informations to sender's address

   -- +-----+-----------------------+-------------+
   -- | 432 | 900 Somerville Avenue | Residential |
   -- +-----+-----------------------+-------------+

   SELECT * FROM "addresses"
   ...> WHERE "address" = '2, Finnegan Street';  -- i notice there's no information related to this address

SELECT * FROM "packages"
   ...> WHERE "from_address_id" = (
   ...>     SELECT "id" FROM "addresses"
   ...>     WHERE "id" = 432
   ...> );  -- checking for what the packages related to the sender are there

--   +------+-----------------------+-----------------+---------------+
--   |  id  |       contents        | from_address_id | to_address_id |
--   +------+-----------------------+-----------------+---------------+
--   | 384  | Congratulatory letter | 432             | 854           |
--   | 2437 | String                | 432             | 484           |
--   | 3529 | Letter opener         | 432             | 585           |
--   | 5436 | Whiteboard            | 432             | 4984          |
--   +------+-----------------------+-----------------+---------------+

SELECT * FROM "scans"
   ...> WHERE "package_id" = 384;  -- finding the information about the delivery in the scans table

-- +----+-----------+------------+------------+--------+----------------------------+
-- | id | driver_id | package_id | address_id | action |         timestamp          |
-- +----+-----------+------------+------------+--------+----------------------------+
-- | 54 | 1         | 384        | 432        | Pick   | 2023-07-11 19:33:55.241794 |
-- | 94 | 1         | 384        | 854        | Drop   | 2023-07-11 23:07:04.432178 |
-- +----+-----------+------------+------------+--------+----------------------------+

SELECT * FROM "addresses"
   ...> WHERE "id" = 854; -- i search up where the letter ended up

-- +-----+-------------------+-------------+
-- | id  |      address      |    type     |
-- +-----+-------------------+-------------+
-- | 854 | 2 Finnigan Street | Residential |
-- +-----+-------------------+-------------+


-- *** The Devious Delivery ***

SELECT * FROM "packages"
   ...> WHERE "from_address_id" IS NULL; -- checking the informations about the package

-- +------+---------------+-----------------+---------------+
-- |  id  |   contents    | from_address_id | to_address_id |
-- +------+---------------+-----------------+---------------+
-- | 5098 | Duck debugger | NULL            | 50            |
-- +------+---------------+-----------------+---------------+

SELECT * FROM "scans"
   ...> WHERE "package_id" = 5098; -- checking the package id in the scans table

-- +-------+-----------+------------+------------+--------+----------------------------+
-- |  id   | driver_id | package_id | address_id | action |         timestamp          |
-- +-------+-----------+------------+------------+--------+----------------------------+
-- | 30123 | 10        | 5098       | 50         | Pick   | 2023-10-24 08:40:16.246648 |
-- | 30140 | 10        | 5098       | 348        | Drop   | 2023-10-24 10:08:55.610754 |
-- +-------+-----------+------------+------------+--------+----------------------------+

SELECT * FROM "addresses"
   ...> WHERE "id" = 348; -- finding out where the package was dropped

-- +-----+------------------+----------------+
-- | id  |     address      |      type      |
-- +-----+------------------+----------------+
-- | 348 | 7 Humboldt Place | Police Station |
-- +-----+------------------+----------------+

-- *** The Forgotten Gift ***

SELECT * FROM "addresses" -- searching up the mentioned addresses to gather initial information
   ...> WHERE "address" IN ('109 Tileston Street', '728 Maple Place');

-- +------+---------------------+-------------+
-- |  id  |       address       |    type     |
-- +------+---------------------+-------------+
-- | 4983 | 728 Maple Place     | Residential |
-- | 9873 | 109 Tileston Street | Residential |
-- +------+---------------------+-------------+

SELECT * FROM "packages" -- checking the package table to see what the contents were
   ...> WHERE "from_address_id" = 9873 AND "to_address_id" = 4983;

-- +------+----------+-----------------+---------------+
-- |  id  | contents | from_address_id | to_address_id |
-- +------+----------+-----------------+---------------+
-- | 9523 | Flowers  | 9873            | 4983          |
-- +------+----------+-----------------+---------------+

SELECT * FROM "scans"
   ...> WHERE "package_id" = 9523; -- checking the scans table to see what happened to the gift

-- +-------+-----------+------------+------------+--------+----------------------------+
-- |  id   | driver_id | package_id | address_id | action |         timestamp          |
-- +-------+-----------+------------+------------+--------+----------------------------+
-- | 10432 | 11        | 9523       | 9873       | Pick   | 2023-08-16 21:41:43.219831 |
-- | 10500 | 11        | 9523       | 7432       | Drop   | 2023-08-17 03:31:36.856889 |
-- | 12432 | 17        | 9523       | 7432       | Pick   | 2023-08-23 19:41:47.913410 |
-- +-------+-----------+------------+------------+--------+----------------------------+

SELECT * FROM "drivers"
   ...> WHERE "id" = 17; -- checking who has the flowers

-- +----+-------+
-- | id | name  |
-- +----+-------+
-- | 17 | Mikel |
-- +----+-------+
