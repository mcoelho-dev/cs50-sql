SELECT ROUND(AVG("final_game"), 0) AS "Average Year" FROM "players"
WHERE "bats" = 'R' ORDER BY "final_game" ASC;
