WITH Numbers AS (
    SELECT 2 AS Num
    UNION ALL
    SELECT Num + 1
    FROM Numbers
    WHERE Num < 1000
),
PrimeNumbers AS (
    SELECT Num
    FROM Numbers AS n
    WHERE NOT EXISTS (
        SELECT 1
        FROM Numbers AS d
        WHERE d.Num < n.Num AND n.Num % d.Num = 0
    )
)
SELECT STRING_AGG(CAST(Num AS VARCHAR), '&') AS PrimeNumbers
FROM PrimeNumbers
OPTION (MAXRECURSION 0);
