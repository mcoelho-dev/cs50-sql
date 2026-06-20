SELECT "first_name", "last_name" FROM (
    SELECT "first_name", "last_name", "id" FROM (
        SELECT "first_name", "last_name", "id" FROM (
            SELECT "players"."first_name", "players"."last_name", "players"."id",
                   "salaries"."salary" / "performances"."H" AS "dollars_per_hit"
            FROM "players"
            JOIN "salaries" ON "players"."id" = "salaries"."player_id"
            JOIN "performances" ON "players"."id" = "performances"."player_id"
                AND "salaries"."year" = "performances"."year"
            WHERE "salaries"."year" = 2001 AND "performances"."H" != 0
            ORDER BY "dollars_per_hit" ASC, "first_name" ASC, "last_name" ASC
            LIMIT 10
        )

        INTERSECT

        SELECT "first_name", "last_name", "id" FROM (
            SELECT "players"."first_name", "players"."last_name", "players"."id",
                   "salaries"."salary" / "performances"."RBI" AS "dollars_per_rbi"
            FROM "players"
            JOIN "salaries" ON "players"."id" = "salaries"."player_id"
            JOIN "performances" ON "players"."id" = "performances"."player_id"
                AND "salaries"."year" = "performances"."year"
            WHERE "salaries"."year" = 2001 AND "performances"."RBI" != 0
            ORDER BY "dollars_per_rbi" ASC, "first_name" ASC, "last_name" ASC
            LIMIT 10
        )
    )
)
ORDER BY "id" ASC;
