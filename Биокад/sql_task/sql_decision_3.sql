SELECT COUNT(*)
FROM Schedule AS s
JOIN Class AS c ON c.id = s.class
WHERE   YEAR(date) = 2019
        AND MONTH(date) = 8
        AND c.name LIKE "%A%";
