CREATE TABLE BU_Finances (
    month VARCHAR(7), -- Format 'YYYY-MM'
    cost DECIMAL(18, 2),
    revenue DECIMAL(18, 2)
);

INSERT INTO BU_Finances (month, cost, revenue) VALUES
('2023-01', 10000.00, 15000.00),
('2023-02', 12000.00, 18000.00),
('2023-03', 11000.00, 17000.00);

SELECT 
    month,
    (cost * 1.0 / revenue) AS cost_revenue_ratio
FROM 
    BU_Finances;
