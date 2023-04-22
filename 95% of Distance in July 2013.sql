
WITH combined_trips AS (
    SELECT Trip_Distance
    FROM yellow_taxis
    WHERE Month = 7 AND Year = 2013
    UNION ALL
    SELECT Trip_Distance
    FROM uber
    WHERE Month = 7 AND Year = 2013
),
ordered_trips AS (
    SELECT Trip_Distance,
           ROW_NUMBER() OVER (ORDER BY Trip_Distance) AS row_num
    FROM combined_trips
),
total_trips AS (
    SELECT COUNT(*) AS total_count
    FROM combined_trips
)
SELECT Trip_Distance
FROM ordered_trips
WHERE row_num = (SELECT ROUND(total_count * 0.95) FROM total_trips)
LIMIT 1;
