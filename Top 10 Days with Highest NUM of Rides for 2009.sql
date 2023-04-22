
WITH combined_trips AS (
    SELECT Date, Trip_Distance
    FROM yellow_taxis
    WHERE Year = 2009
    UNION ALL
    SELECT Pickup_Date AS Date, Trip_Distance
    FROM uber
    WHERE Year = 2009
),
daily_summary AS (
    SELECT Date,
           COUNT(*) AS num_rides,
           AVG(Trip_Distance) AS avg_distance
    FROM combined_trips
    GROUP BY Date
)
SELECT Date, num_rides, avg_distance
FROM daily_summary
ORDER BY num_rides DESC
LIMIT 10;
