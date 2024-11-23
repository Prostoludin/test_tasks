SELECT  sub.name,
        s.class,
        ROUND(SUM(MINUTE(TIMEDIFF(t.end_pair, t.start_pair))/60), 1) AS hours_sum
FROM Schedule AS s
JOIN Subject AS sub ON sub.id = s.subject
JOIN Timepair AS t ON t.id = s.number_pair
WHERE sub.name LIKE "%language%"
GROUP BY sub.name, s.class
ORDER BY sub.name, s.class;

