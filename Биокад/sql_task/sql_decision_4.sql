SELECT  id,
        first_name,
        middle_name,
        last_name,
        "teacher" AS Type
FROM Teacher
UNION
SELECT  id,
        first_name,
        middle_name,
        last_name,
        "student" AS Type
FROM Student;
