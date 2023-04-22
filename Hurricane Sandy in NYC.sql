
WITH hourly_trips AS (
    SELECT COUNT(*) AS num_rides, strftime('%Y-%m-%d %H', Pickup_Time) AS hour
    FROM (
        SELECT Pickup_Time FROM yellow_taxis WHERE Date BETWEEN '2012-10-22 00:00:00' AND '2012-11-06 23:59:59'
        UNION ALL
        SELECT Pickup FROM uber WHERE Pickup BETWEEN '2012-10-22 00:00:00' AND '2012-11-06 23:59:59'
    ) all_trips
    GROUP BY hour
),
hourly_weather_data AS (
    SELECT strftime('%Y-%m-%d %H', Record_Time) AS hour, AVG(HourlyWindSpeed) AS avg_wind_speed, SUM(HourlyPrecipitation) AS total_precipitation
    FROM hourly_weather
    WHERE Record_Time BETWEEN '2012-10-22 00:00:00' AND '2012-11-06 23:59:59'
    GROUP BY hour
),
all_hours AS (
    SELECT strftime('%Y-%m-%d %H', Record_Time) AS hour
    FROM hourly_weather
    WHERE Record_Time BETWEEN '2012-10-22 00:00:00' AND '2012-11-06 23:59:59'
)
SELECT all_hours.hour, COALESCE(hourly_trips.num_rides, 0) AS num_rides, COALESCE(hourly_weather_data.total_precipitation, 0) AS total_precipitation, COALESCE(hourly_weather_data.avg_wind_speed, 0) AS avg_wind_speed
FROM all_hours
LEFT JOIN hourly_trips ON all_hours.hour = hourly_trips.hour
LEFT JOIN hourly_weather_data ON all_hours.hour = hourly_weather_data.hour
ORDER BY all_hours.hour;
