
CREATE TABLE STATION (
    ID INT,
    CITY VARCHAR(21),
    STATE VARCHAR(2),
    LAT_N FLOAT,
    LONG_W FLOAT
);


INSERT INTO STATION (ID, CITY, STATE, LAT_N, LONG_W) VALUES
(1, 'New York', 'NY', 40.7128, -74.0060),
(2, 'Los Angeles', 'CA', 34.0522, -118.2437),
(3, 'Chicago', 'IL', 41.8781, -87.6298),
(4, 'Houston', 'TX', 29.7604, -95.3698),
(5, 'Phoenix', 'AZ', 33.4484, -112.0740);


WITH Coordinates AS (
    SELECT MIN(LAT_N) AS MinLat, 
           MAX(LAT_N) AS MaxLat, 
           MIN(LONG_W) AS MinLong, 
           MAX(LONG_W) AS MaxLong
    FROM STATION
)
SELECT ROUND(ABS(MinLat - MaxLat) + ABS(MinLong - MaxLong), 4) AS ManhattanDistance
FROM Coordinates;
