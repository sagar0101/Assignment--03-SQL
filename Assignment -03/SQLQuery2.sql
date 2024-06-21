
WITH Students AS (
    SELECT 1 AS ID, 'Ashley' AS Name UNION ALL
    SELECT 2 AS ID, 'Samantha' AS Name UNION ALL
    SELECT 3 AS ID, 'Julia' AS Name UNION ALL
    SELECT 4 AS ID, 'Scarlet' AS Name
),

Friends AS (
    SELECT 1 AS ID, 2 AS Friend_ID UNION ALL
    SELECT 2 AS ID, 3 AS Friend_ID UNION ALL
    SELECT 3 AS ID, 4 AS Friend_ID UNION ALL
    SELECT 4 AS ID, 1 AS Friend_ID
),

Packages AS (
    SELECT 1 AS ID, 15.20 AS Salary UNION ALL
    SELECT 2 AS ID, 10.06 AS Salary UNION ALL
    SELECT 3 AS ID, 11.55 AS Salary UNION ALL
    SELECT 4 AS ID, 12.12 AS Salary
)

SELECT s.Name
FROM Students s
JOIN Friends f ON s.ID = f.ID
JOIN Packages sp ON s.ID = sp.ID
JOIN Packages fp ON f.Friend_ID = fp.ID
WHERE fp.Salary > sp.Salary
ORDER BY fp.Salary;
