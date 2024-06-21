
WITH BST AS (
    SELECT 1 AS N, 2 AS P UNION ALL
    SELECT 3 AS N, 2 AS P UNION ALL
    SELECT 8 AS N, 6 AS P UNION ALL
    SELECT 9 AS N, 8 AS P UNION ALL
    SELECT 2 AS N, 5 AS P UNION ALL
    SELECT 5 AS N, NULL AS P
),

NodeType AS (
    SELECT 
        N,
        P,
        CASE
            WHEN P IS NULL THEN 'Root'
            WHEN N NOT IN (SELECT P FROM BST WHERE P IS NOT NULL) THEN 'Leaf'
            ELSE 'Inner'
        END AS NodeType
    FROM BST
)

SELECT N, NodeType
FROM NodeType
ORDER BY N;
