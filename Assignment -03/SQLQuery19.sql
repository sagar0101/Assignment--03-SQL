-- Simulate data using CTEs
WITH EMPLOYEES (Name, Salary) AS (
    SELECT 'John', 5000 UNION ALL
    SELECT 'Jane', 6000 UNION ALL
    SELECT 'Michael', 0 UNION ALL
    SELECT 'Emily', 5500 UNION ALL
    SELECT 'Robert', 0 UNION ALL
    SELECT 'Sophia', 7000
),

-- Calculate the actual average monthly salary
ActualAverage AS (
    SELECT AVG(Salary) AS AvgSalary
    FROM EMPLOYEES
),

-- Calculate the average salary with zeroes removed
SalaryWithoutZeroes AS (
    SELECT AVG(CASE WHEN Salary <> 0 THEN Salary END) AS AvgSalaryWithoutZeroes
    FROM EMPLOYEES
)

-- Calculate the difference and round it up to the next integer
SELECT CEILING(ABS((SELECT AvgSalaryWithoutZeroes FROM SalaryWithoutZeroes) - (SELECT AvgSalary FROM ActualAverage))) AS ErrorAmount;
