CREATE TABLE EmployeeCosts (
    Month INT,
    EmployeeCount INT,
    CostPerEmployee DECIMAL(10, 2),
    BusinessUnit VARCHAR(50)
);

INSERT INTO EmployeeCosts (Month, EmployeeCount, CostPerEmployee, BusinessUnit)
VALUES 
    (1, 100, 5000.00, 'BU1'),
    (2, 110, 5100.00, 'BU1'),
    (1, 120, 5200.00, 'BU2'),
    (2, 130, 5300.00, 'BU2');

WITH WeightedAverage AS (
    SELECT 
        BusinessUnit,
        Month,
        SUM(EmployeeCount * CostPerEmployee) / SUM(EmployeeCount) AS WeightedAvgCost
    FROM EmployeeCosts
    GROUP BY BusinessUnit, Month
)
SELECT 
    BusinessUnit,
    Month,
    WeightedAvgCost
FROM WeightedAverage
ORDER BY BusinessUnit, Month;
