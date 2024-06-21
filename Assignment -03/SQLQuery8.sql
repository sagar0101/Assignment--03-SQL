
CREATE TABLE OCCUPATIONS (
    Name VARCHAR(50),
    Occupation VARCHAR(50)
);


INSERT INTO OCCUPATIONS (Name, Occupation) VALUES
('Samantha', 'Doctor'),
('Julia', 'Actor'),
('Maria', 'Actor'),
('Meera', 'Singer'),
('Ashley', 'Professor'),
('Ketty', 'Professor'),
('Christina', 'Professor'),
('Jane', 'Actor'),
('Jenny', 'Doctor');


WITH NumberedOccupations AS (
    SELECT 
        Name,
        Occupation,
        ROW_NUMBER() OVER (PARTITION BY Occupation ORDER BY Name) AS RowNum
    FROM OCCUPATIONS
)
SELECT 
    COALESCE(MAX(CASE WHEN Occupation = 'Doctor' THEN Name END), 'NULL') AS Doctor,
    COALESCE(MAX(CASE WHEN Occupation = 'Professor' THEN Name END), 'NULL') AS Professor,
    COALESCE(MAX(CASE WHEN Occupation = 'Singer' THEN Name END), 'NULL') AS Singer,
    COALESCE(MAX(CASE WHEN Occupation = 'Actor' THEN Name END), 'NULL') AS Actor
FROM NumberedOccupations
GROUP BY RowNum
ORDER BY RowNum;
