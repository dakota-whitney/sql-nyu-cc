/*Examine startups table*/
SELECT *
FROM startups;

/*Calculate the total number of companies in the table.*/
SELECT COUNT(name)
FROM startups;
/*70*/

/*We want to know the total value of all companies in this table. Calculate this by getting the SUM() of the valuation column.*/
SELECT SUM(valuation)
FROM startups;
/*$974,455,790,000*/

/*What is the highest amount raised by a startup? Return the maximum amount of money raised.*/
SELECT MAX(raised)
FROM startups;
/*$11,500,000,000*/

/*Edit the query so that it returns the maximum amount of money raised, during ‘Seed’ stage.*/
SELECT MAX(raised)
FROM startups
WHERE stage = 'Seed';
/*$1,800,000*/

/*In what year was the oldest company on the list founded?*/
SELECT MIN(founded)
FROM startups;
/*1994*/

/*Return the average valuation.*/
SELECT AVG(valuation)
FROM startups;

/*Return the average valuation, in each category.*/
SELECT category,AVG(valuation)
FROM startups
GROUP BY category;

/*Return the average valuation, in each category. Round the averages to two decimal places.*/
SELECT category,ROUND(AVG(valuation),2)
FROM startups
GROUP BY category;

/*Return the average valuation, in each category. Round the averages to two decimal places. Lastly, order the list from highest averages to lowest.*/
SELECT category,ROUND(AVG(valuation),2)
FROM startups
GROUP BY category
ORDER BY ROUND(AVG(valuation),2) DESC;

/*First, return the name of each category with the total number of companies that belong to it.*/
SELECT category,COUNT(name)
FROM startups
GROUP BY category;

/*Next, filter the result to only include categories that have more than three companies in them. What are the most competitive markets?*/
SELECT category,COUNT(name) AS 'Number of Companies'
FROM startups
GROUP BY category
HAVING COUNT(name) > 3;

/*What is the average size of a startup in each location?*/
SELECT location,AVG(employees) AS 'Average Startup Size'
FROM startups
GROUP BY location;

/*What is the average size of a startup in each location, with average sizes above 500?*/
SELECT location,AVG(employees) AS 'Average Startup Size'
FROM startups
GROUP BY location
HAVING AVG(employees) > 500;