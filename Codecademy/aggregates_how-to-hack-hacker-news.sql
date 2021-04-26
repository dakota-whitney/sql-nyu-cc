 /*Start by getting a feel for the hacker_news table! Let’s find the most popular Hacker News stories. What are the top five stories with the highest scores?*/
 SELECT title, score
 FROM hacker_news
 ORDER By score DESC
 LIMIT 5;

 /*First, find the total score of all the stories.*/
 SELECT SUM(score)
 FROM hacker_news;

 /*Find the individual users who have gotten combined scores of more than 200, and their combined scores.*/
 SELECT user, SUM(score)
 FROM hacker_news
 GROUP BY user
 HAVING SUM(score) > 200

 /*Then, we want to add these users’ scores together and divide by the total to get the percentage.*/
SELECT (309 + 304 + 282 + 517) / 6366.0;
/*.221803330191643*/

/*Oh no! While we are looking at the power users, some users are rickrolling — tricking readers into clicking on a link to a funny video and claiming that it links to information about coding. The url of the video is:
https://www.youtube.com/watch?v=dQw4w9WgXcQ
How many times has each offending user posted this link?*/
SELECT user,COUNT(user)
FROM hacker_news
WHERE url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ'
GROUP BY user;

/*Hacker News stories are essentially links that take users to other websites. Which of these sites feed Hacker News the most:
GitHub, Medium, or New York Times?
First, we want to categorize each story based on their source. We can do this using a CASE statement Fill in the other WHEN statements and the ELSE statement.*/
SELECT CASE
WHEN url LIKE '%github.com%' THEN 'Github'
WHEN url LIKE '%medium.com%' THEN 'Medium'
WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
ELSE NULL
END AS 'Source'
FROM hacker_news;

/*Next, build on the previous query. Add a column for the number of stories from each URL using COUNT(). Also, GROUP BY the CASE statement.*/
SELECT
CASE
WHEN url LIKE '%github.com%' THEN 'Github'
WHEN url LIKE '%medium.com%' THEN 'Medium'
WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
ELSE NULL
END AS 'Source',
COUNT(*)
FROM hacker_news
GROUP BY 1;

/*What’s the best time of the day to post a story on Hacker News?*/
SELECT strftime('%H',timestamp),AVG(score),COUNT(title)
FROM hacker_news
GROUP BY 1;

/*Let’s edit a few things in the previous query:
- Round the average scores (ROUND()).
- Rename the columns to make it more readable (AS)
- Add a WHERE clause to filter out the NULL values in timestamp.
Take a look at the result again. What are the best hours to post a story on Hacker News?*/
SELECT strftime('%H',timestamp) AS 'Hour',ROUND(AVG(score),1) AS 'Average Score',COUNT(title) AS 'Stories'
FROM hacker_news
WHERE timestamp IS NOT NULL
GROUP BY 1;
/*4am*/