

CREATE TABLE Employee (
    Column1 INT,
    Column2 INT
);


INSERT INTO Employee (Column1, Column2)
VALUES (10, 20);


UPDATE Employee
SET Column1 = CASE WHEN Column1 <> Column2 THEN Column2 ELSE Column1 END,
    Column2 = CASE WHEN Column1 <> Column2 THEN Column1 ELSE Column2 END;

SELECT * FROM Employee;

