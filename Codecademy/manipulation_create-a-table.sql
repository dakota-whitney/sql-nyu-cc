/*Create a table named friends with three columns:
- id that stores INTEGER
- name that stores TEXT
- birthday that stores DATE*/
CREATE TABLE friends (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  birthday DATE NOT NULL
);

/*Beneath your current code, add Ororo Munroe to friends. Her birthday is May 30th, 1940.*/
INSERT INTO friends (id,name,birthday)
VALUES (1,'Ororo Munroe','5/30/1945');

/*Let’s make sure that Ororo has been added to the database. Check for two things:
- Is friends table created?
- Is Ororo Munroe added to it?*/
INSERT INTO friends (id,name,birthday)
VALUES (2,'James Howlett','10/1/1974');
/*Yes*/

/*Add two of your friends to the table. Insert an id, name, and birthday for each of them.*/
INSERT INTO friends (id,name,birthday)
VALUES (3,'Wade Wilson','11/22/1973');

/*Ororo Munroe just realized that she can control the weather and decided to change her name. Her new name is “Storm”. Update her record in friends.*/
UPDATE friends
SET name = 'Storm'
WHERE name = 'Ororo Munroe';

/*Add a new column named email.*/
ALTER TABLE friends
ADD COLUMN email TEXT;


/*Update the email address for everyone in your table. Storm’s email is storm@codecademy.com.*/
UPDATE friends
SET email = 'storm@codecademy.com'
WHERE name = 'Storm';

UPDATE friends
SET email = 'wolverine@codecademy.com'
WHERE name = 'James Howlett';

UPDATE friends
SET email = 'deadpool@codecademy.com'
WHERE name = 'Wade Wilson';

/*Wait, Storm is fictional. Remove her from friends.*/
DELETE FROM friends
WHERE name = 'Storm';

/*Great job! Let’s take a look at the result one last time:*/
SELECT * FROM friends;