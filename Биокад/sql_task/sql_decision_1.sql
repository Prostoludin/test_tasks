WITH classes AS
(SELECT class
FROM Schedule
WHERE id LIKE (SELECT id
               FROM Teacher
               WHERE CONCAT(last_name, " ", first_name, " ", middle_name)
                     LIKE "Moiseev Bogdan Romanovich")
                     )
SELECT s.last_name, s.first_name, sic.class
FROM Student AS s
JOIN Student_in_class AS sic ON sic.student = s.id
WHERE middle_name IS NULL
      AND sic.class IN (SELECT * FROM classes);