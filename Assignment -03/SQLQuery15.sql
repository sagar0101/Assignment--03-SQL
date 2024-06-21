
DECLARE @employees TABLE (
    emp_id INT,
    emp_name VARCHAR(50),
    salary DECIMAL(10, 2)
);


INSERT INTO @employees (emp_id, emp_name, salary)
VALUES
    (1, 'John Doe', 50000.00),
    (2, 'Jane Smith', 60000.00),
    (3, 'Michael Johnson', 55000.00),
    (4, 'Emily Brown', 62000.00),
    (5, 'David Lee', 58000.00),
    (6, 'Sarah Clark', 59000.00);


SELECT TOP 5 emp_id, emp_name, salary
FROM @employees e1
WHERE 5 > (SELECT COUNT(DISTINCT e2.salary) 
           FROM @employees e2 
           WHERE e2.salary > e1.salary);
