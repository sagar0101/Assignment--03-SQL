CREATE TABLE JobFamilyCosts (
    location VARCHAR(50),
    cost DECIMAL(18, 2)
);

INSERT INTO JobFamilyCosts (location, cost) VALUES
('India', 50000.00),
('International', 30000.00),
('India', 45000.00),
('International', 35000.00);

SELECT 
    location, 
    (SUM(cost) * 100.0 / (SELECT SUM(cost) FROM JobFamilyCosts)) AS cost_percentage
FROM 
    JobFamilyCosts
GROUP BY 
    location;
