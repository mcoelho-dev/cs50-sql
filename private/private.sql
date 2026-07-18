CREATE VIEW "message" AS
    SELECT SUBSTR(sentence, 98, 4) AS "phrase" FROM "sentences" WHERE "id" = 14
    UNION ALL
    SELECT SUBSTR(sentence, 3, 5) AS "phrase" FROM "sentences" WHERE "id" = 114
    UNION ALL
    SELECT SUBSTR(sentence, 72, 9) AS "phrase" FROM "sentences" WHERE "id" = 618
    UNION ALL
    SELECT SUBSTR(sentence, 7, 3) AS "phrase" FROM "sentences" WHERE "id" = 630
    UNION ALL
    SELECT SUBSTR(sentence, 12, 5) AS "phrase" FROM "sentences" WHERE "id" = 932
    UNION ALL
    SELECT SUBSTR(sentence, 50, 7) AS "phrase" FROM "sentences" WHERE "id" = 2230
    UNION ALL
    SELECT SUBSTR(sentence, 44, 10) AS "phrase" FROM "sentences" WHERE "id" = 2346
    UNION ALL
    SELECT SUBSTR(sentence, 14, 5) AS "phrase" FROM "sentences" WHERE "id" = 3041;
;
