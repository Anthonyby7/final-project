# IEOR4501 Final Project 
Group 3 (Jingren Zhao jz3541  &  Xingyu Hu xh255)

### Basic Description

The principal objective of this project is to delve into the hired-ride trip data sourced from Uber and NYC Yellow cab, 
spanning from January 2009 to June 2015. By coupling this information with locally archived weather data, our aim is to unearth 
a few discernible patterns that substantiate the long-standing contention between Uber and taxis. 
In order to achieve this, we first undertook the task of preprocessing the data by eliminating null values, adjusting the data types, 
computing requisite figures, and sieving out relevant data. Following this, we proceeded to establish and populate five tables, viz. 
one each for sampled datasets of Yellow Taxi trips and Uber trips, one for hourly weather information, one for daily weather information, 
and finally, one for daily sunrise and sunset data. Having accomplished this, we meticulously crafted an array of SQL queries to comprehensively comprehend the datasets and used visually appealing graphics to augment the readers' understanding of the same.
 
### Data Preprocessing

#### Yellow Taxi Data

* First of all, from the given website, we download the yellow taxi data programmatically month by month. <br> The function named: *download_yellow_taxi_data(start_date, end_date)*
* Then we defined a function *get_and_clean_taxi_data()* that appends data from 2009 to 2015 year by year
* After logging and downloading our data, we wrote a function that cleaned and purified the data. <br> The function named: *clean_type_of_taxi_data(data: pd.DataFrame)*

#### Weather Data

* By specifying the column names, we firstly wrote a function that merged every year's weather data from 2009 to 2015. <br> The function named: *merge_weather_file()
* After that, 3 functions were written in order to generate corresponding daily, hourly and sun-related data. <br> These functions are named: *clean_month_weather_data_hourly(csv_file), clean_month_weather_data_daily(csv_file), clean_month_sun_data_daily(csv_file)

#### Uber Data

* Define a function to process Uber data: filter the trips in the NYC area, drop unnecessary and null values, rename column names, append to the dataframe, and standardize the column types to desired format <br> *load_and_clean_uber_data(csv_file)
* Define a function to add a column that calculate trips distance <br> *def get_uber_data()

#### Distance Calculation 

* Defined a function called *calculate_trip_distance(from_coord: tuple, to_coord: tuple)* inside of a function called: <br> *add_trip_distance_column(dataframe)* where the first function calculates the distance between dropoffs and pickups, and then add that distance to our dataframe.

### Storing cleaned data

In Part 2, we take the sample datasets generated from Part 1, and populate a SQLite database with tables generated from the datasets.

* Firstly created 4 schema as seen in schema files: *daily_weather, hourly_weather, yellow_taxis, uber*
* Then we load the cleaned data into these tables by function: <br> *write_dataframes_to_table(engine , csv, table_name_to_dataframe)*

### SQL Queries

In Part 3, we crafted a set of SQL queries to develop a better understanding of the datasets we’re working with.

#### Query 1
For 01-2009 through 06-2015, show the popularity of Yellow Taxi rides for each hour of the day. 
* *Top Hours of Yellow Taxi.sql
#### Query 2
For the same time frame, show the popularity of Uber rides for each day of the week.
* *Top Day of Week for Uber.sql
#### Query 3
What is the 95% percentile of distance traveled for all hired trips during July 2013?
* *95% of Distance in July 2013.sql
#### Query 4
What were the top 10 days with the highest number of hired rides for 2009, and what was the average distance for each day?
* *Top 10 Days with Highest NUM of Rides for 2009.sql
#### Query 5
Which 10 days in 2014 were the windiest on average, and how many hired trips were made on those days?
* *Top 10 Windiest Days in 2014.sql
#### Query 6
During Hurricane Sandy in NYC (Oct 29-30, 2012), plus the week leading up and the week after, how many trips were taken each hour, and for each hour, how much precipitation did NYC receive and what was the sustained wind speed? 
* *Hurricane Sandy in NYC.sql
#### Extra Credit Query
In 2014, which 10 days had the highest number of yellow taxi rides, and what was the sunset time on these 10 days?

### Data Visualization

* Create an appropriate visualization for the first query/question in part 3.

* Create a visualization that shows the average distance traveled per month (regardless of year - so group by each month) for both taxis and Ubers combined. Include the 90% confidence interval around the mean in the visualization.

* Define three lat/long coordinate boxes around the three major New York airports: LGA, JFK, and EWR (you can use bboxfinder to help). Create a visualization that compares what day of the week was most popular for drop offs for each airport. 

* Create a heatmap of all hired trips over a map of the area. Consider using Folium or KeplerGL or another library that helps generate geospatial visualizations.

* Depending on the library you use, the visualization may not render when viewing on GitHub (after you’ve pushed your code). If that’s the case, please include a screenshot in your repository.

* Create a scatter plot that compares tip amount versus distance for Yellow Taxi rides. You may remove any outliers how you see fit.

* Create another scatter plot that compares tip amount versus precipitation amount for Yellow Taxi rides. You may remove any outliers how you see fit.
