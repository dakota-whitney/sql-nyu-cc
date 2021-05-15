/*What are the column names?*/

SELECT * FROM trips;
SELECT * FROM riders;
SELECT * FROM cars;

/*id,date,pickup,dropoff,rider_id,car_id,type,cost
id,first,last,username,rating,total_trips,referred
id,model,OS,status,trips_completed*/

/*What's the primary key of trips? id
What's the primary key of riders? id
What's the primary key of cars? id*/

/*Try out a simple cross join between riders and cars. Is the result useful?*/
SELECT *
FROM riders
CROSS JOIN cars;

/*Suppose we want to create a Trip Log with the trips and its users.

Find the columns to join between trips and riders and combine the two tables using a LEFT JOIN.*/
SELECT trips.id AS "trip id",trips.date AS "date",riders.id AS "rider id",riders.first AS "first name",riders.last AS "last name",trips.pickup AS "pickup",trips.dropoff AS "dropoff",trips.cost AS "cost"
FROM trips
LEFT JOIN riders
ON trips.rider_id = riders.id;

/*Suppose we want to create a link between the trips and the cars used during those trips.

Find the columns to join on and combine the trips and cars table using an INNER JOIN.*/
SELECT trips.id AS "trip id",trips.date AS "date",cars.id AS "car id",cars.model AS "model",cars.trips_completed AS "trips completed",cars.status AS "status"
FROM trips
INNER JOIN cars
ON trips.car_id = cars.id;

/*The new riders data are in! There are three new users this month.

Stack the riders table on top of the new table named riders2.*/
SELECT *
FROM riders
UNION
SELECT *
FROM riders2;

/*BONUS: What is the average cost for a trip?*/
SELECT AVG(cost) AS "average cost for a trip"
FROM trips;
/*31.92*/

/*Lyft is looking to do an email campaign for all the irregular users.

Find all the riders who have used Lyft less than 500 times!*/
SELECT *
FROM riders
WHERE total_trips < 500
UNION
SELECT *
FROM riders2
WHERE total_trips < 500;

/*Calculate the number of cars that are active.*/SELECT COUNT(*)
FROM cars
WHERE status = "active";

/*It’s safety recall time for cars that have been on the road for a while.

Write a query that finds the two cars that have the highest trips_completed.*/
SELECT id, model, trips_completed
FROM cars
ORDER BY trips_completed DESC
LIMIT 2;