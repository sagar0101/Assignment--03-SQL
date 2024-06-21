CREATE TABLE Employees (
    sub_band VARCHAR(50)
);

INSERT INTO Employees (sub_band) VALUES
('A1'), ('A1'), ('A2'), ('A2'), ('A2'), ('B1'), ('B1'), ('B2');

SELECT 
    sub_band,
    COUNT(*) AS headcount,
    COUNT(*) * 100.0 / SUM(COUNT(*)) OVER () AS headcount_percentage
FROM 
    Employees
GROUP BY 
    sub_band;
