WITH Projects (Task_ID, Start_Date, End_Date) AS (
    SELECT 1, '2015-10-01', '2015-10-02' UNION ALL
    SELECT 2, '2015-10-02', '2015-10-03' UNION ALL
    SELECT 3, '2015-10-03', '2015-10-04' UNION ALL
    SELECT 4, '2015-10-13', '2015-10-14' UNION ALL
    SELECT 5, '2015-10-14', '2015-10-15' UNION ALL
    SELECT 6, '2015-10-28', '2015-10-29' UNION ALL
    SELECT 7, '2015-10-30', '2015-10-31'
),
ProjectGroups AS (
    SELECT
        Task_ID,
        Start_Date,
        End_Date,
        DATEADD(DAY, -ROW_NUMBER() OVER (ORDER BY Start_Date), Start_Date) AS GroupingID
    FROM Projects
),
GroupedProjects AS (
    SELECT
        MIN(Start_Date) AS Project_Start_Date,
        MAX(End_Date) AS Project_End_Date,
        DATEDIFF(DAY, MIN(Start_Date), MAX(End_Date)) + 1 AS Duration
    FROM ProjectGroups
    GROUP BY GroupingID
)
SELECT 
    Project_Start_Date,
    Project_End_Date
FROM GroupedProjects
ORDER BY
    Duration ASC,
    Project_Start_Date ASC;
