
WITH windiest_days AS (
    SELECT Date, AVG(HourlyWindSpeed) AS avg_wind_speed
    FROM hourly_weather
    WHERE Year = 2014
    GROUP BY Date
    ORDER BY avg_wind_speed DESC
    LIMIT 10
),
combined_trips AS (
    SELECT Date, COUNT(*) AS num_rides
    FROM (
        SELECT Date FROM yellow_taxis WHERE Year = 2014
        UNION ALL
        SELECT Pickup_Date AS Date FROM uber WHERE Year = 2014
    ) all_trips
    WHERE Date IN (SELECT Date FROM windiest_days)
    GROUP BY Date
)
SELECT windiest_days.Date, windiest_days.avg_wind_speed, COALESCE(combined_trips.num_rides, 0) AS num_rides
FROM windiest_days
LEFT JOIN combined_trips ON windiest_days.Date = combined_trips.Date
ORDER BY windiest_days.avg_wind_speed DESC;
