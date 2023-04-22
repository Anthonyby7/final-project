
SELECT DayofWeek, COUNT(*) as num_of_rides
FROM Uber
WHERE Pickup between '2009-01-01 00:00:00' and '2015-06-30 23:59:59'
GROUP BY DayofWeek
ORDER BY num_of_rides DESC
