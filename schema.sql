DAILY_WEATHER_SCHEMA = """
CREATE TABLE IF NOT EXISTS daily_weather
(
    id INTEGER PRIMARY KEY,
    DailyPrecipitation FLOAT,
    DailySustainedWindSpeed FLOAT,
    DailyPeakWindSpeed FLOAT,
    DailyAverageWindSpeed FLOAT,
    Date TIMESTAMP,
    Record_Time TIMESTAMP,
    Year INTEGER,
    Month INTEGER,
    Day INTEGER,
    Hour INTEGER
);
"""

HOURLY_WEATHER_SCHEMA = """
CREATE TABLE IF NOT EXISTS hourly_weather
(
    id INTEGER PRIMARY KEY,
    HourlyWindSpeed FLOAT,
    HourlyPrecipitation FLOAT,
    Date TIMESTAMP,
    Record_Time TIMESTAMP,
    Year INTEGER,
    Month INTEGER,
    Day INTEGER,
    Hour INTEGER
);
"""

TAXI_TRIPS_SCHEMA = """
CREATE TABLE IF NOT EXISTS yellow_taxis
(
    id INTEGER PRIMARY KEY,
    Date TIMESTAMP,
    Pickup TIMESTAMP,
    Pickup_Time TIMESTAMP,
    Trip_Distance FLOAT,
    Start_Lon FLOAT,
    Start_Lat FLOAT,
    End_Lon FLOAT,
    End_Lat FLOAT,
    Fare_Amt FLOAT,
    Tip_Amt FLOAT,
    Year INTEGER,
    Month INTEGER,
    Day INTEGER,
    Time INTEGER,
    DayofWeek INTEGER
);
"""

UBER_TRIPS_SCHEMA = """
CREATE TABLE IF NOT EXISTS uber
(
    id INTEGER PRIMARY KEY,
    Fare_Amt FLOAT,
    Start_Lon FLOAT,
    Start_Lat FLOAT,
    End_Lon FLOAT,
    End_Lat FLOAT,
    Date TIMESTAMP,
    Year INTEGER,
    Month INTEGER,
    Day INTEGER,
    Hour INTEGER,
    Pickup TIMESTAMP,
    DayofWeek INTEGER,
    Trip_Distance FLOAT,
    Pickup_Date TIMESTAMP
);
"""
