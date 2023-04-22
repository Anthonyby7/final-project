# IEOR4501 Final Project 
Group 3 (Jingren Zhao jz3541  &  Xingyu Hu xh2551)

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
