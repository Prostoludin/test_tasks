SELECT  s.date, 
        tp.start_pair,
        tp.end_pair,
        s.number_pair,
        COUNT(DISTINCT class) AS classes_count
FROM Schedule AS s
JOIN Teacher AS t ON t.id = s.teacher
JOIN Class AS c ON c.id = s.class
JOIN Timepair AS tp ON tp.id = s.number_pair
WHERE CONCAT(t.first_name, " ", t.last_name) LIKE "Andrej Evseev"
GROUP BY s.date, tp.start_pair, tp.end_pair, s.number_pair
HAVING COUNT(DISTINCT class) > 1;