/*
 * This file contains the SQL queries to create the tables for a movie database.
 *
 * Author: Quin Perkins
 * Date: 2023-03-20
 */

/* Query run at 2023-03-20 02:02:05
 *    DB   : qperkins_project
 */

 -- Create table `movie`
 -- `movie_id` is the primary key of the table.
 -- `movie_title` is the title of the movie.
 -- `genre_id` is the ID of the genre that the movie belongs to.
 -- `franchise_id` is the ID of the movie franchise that the movie belongs to.
 -- `runtime` is the length of the movie in minutes.
 -- `language` is the language that the movie is in.
 -- `release_date` is the date that the movie was released.
 -- `parental_rating` is the rating of the movie.
CREATE TABLE movie (
  movie_id INT,
  movie_title CHAR(200),
  genre_id INT,
  franchise_id INT,
  runtime INT,
  language CHAR(50),
  release_date DATE,
  parental_rating CHAR(10),
  PRIMARY KEY (movie_id)
);

-- Create table `genre`
-- `genre_id` is the primary key of the table.
-- `genre_title` is the title of the genre.CREATE TABLE genre (
  genre_id INT,
  genre_title CHAR(50),
  PRIMARY KEY (genre_id)
);

-- Create table `movie_franchise`
-- `franchise_id` is the primary key of the table.
-- `franchise_title` is the title of the movie franchise.
CREATE TABLE movie_franchise (
  franchise_id INT,
  franchise_title CHAR(50),
  PRIMARY KEY (franchise_id)
);

-- Create table `person`
-- `person_id` is the primary key of the table.
-- `first_name` is the first name of the person.
-- `last_name` is the last name of the person.
-- `gender` is the gender of the person.
-- `birthdate` is the date of birth of the person.
CREATE TABLE person (
  person_id INT,
  first_name CHAR(50),
  last_name CHAR(50),
  gender CHAR(1),
  birthdate DATE,
  PRIMARY KEY (person_id)
);

-- Create table `credit`
-- `credit_id` is the primary key of the table.
-- `movie_id` is the ID of the movie that the credit is for.
-- `person_id` is the ID of the person who is credited for the movie.
-- `credit_type` is the type of credit, such as "Cast" or "Crew".
-- `role` is the role of the person in the movie.
-- `movie_id` is a foreign key that references the `movie` table.
-- `person_id` is a foreign key that references the `person` table.
CREATE TABLE credit (
  credit_id INT,
  movie_id INT,
  person_id INT,
  credit_type ENUM('Cast', 'Crew', 'Admin'),
  role CHAR(50),
  PRIMARY KEY (credit_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (person_id) REFERENCES person(person_id)
);

-- Create table `user`
-- `user_id` is the primary key of the table.
-- `user_first_name` is the first name of the user.
-- `user_last_name` is the last name of the user.
CREATE TABLE user (
  user_id INT,
  user_first_name CHAR(50),
  user_last_name CHAR(50),
  PRIMARY KEY (user_id)
);

-- Create table `watchlist`
-- `movie_id` is the ID of the movie in the watchlist.
-- `user_id` is the ID of the user who created the watchlist.
-- `movie_id` is a foreign key that references the `movie` table.
-- `user_id` is a foreign key that references the `user` table.
CREATE TABLE watchlist (
  movie_id INT,
  user_id INT,
  PRIMARY KEY (movie_id, user_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);

-- Create table `streaming_service`
-- `streaming_title` is the name of the streaming service.
-- `streaming_title` is the primary key of the table.
CREATE TABLE streaming_service (
  streaming_title CHAR(25),
  PRIMARY KEY (streaming_title)
);

-- Create table `streaming_library`
-- `streaming_title` is the name of the streaming service.
-- `movie_id` is the ID of the movie that is available on the streaming service.
-- `streaming_title` is a foreign key that references the `streaming_service` table.
-- `movie_id` is a foreign key that references the `movie` table.
CREATE TABLE streaming_library (
  streaming_title CHAR(25),
  movie_id INT,
  PRIMARY KEY (streaming_title, movie_id),
  FOREIGN KEY (streaming_title) REFERENCES streaming_service(streaming_title),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);

-- Create table `user_subscriptions`
-- `user_id` is the ID of the user who has subscribed to the streaming service.
-- `streaming_title` is the name of the streaming service that the user has subscribed to.
-- `user_id` is a foreign key that references the `user` table.
-- `streaming_title` is a foreign key that references the `streaming_service` table.
CREATE TABLE user_subscriptions (
  user_id INT,
  streaming_title CHAR(25),
  PRIMARY KEY (user_id, streaming_title),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (streaming_title) REFERENCES streaming_service(streaming_title)
);

-- Create table `user_diary_to_track_watched_films`
-- `user_id` is the ID of the user who watched the movie.
-- `movie_id` is the ID of the movie that was watched.
-- `rating_out_of_ten` is the rating that the user gave the movie out of 10.
-- `watched_via` is the way that the user watched the movie, such as "Streaming", "Theatre", "Owned", or "Rental".
-- `rewatch` is a boolean value that indicates whether the user plans to watch the movie again.
-- `date_watched` is the date that the user watched the movie.
-- `user_id` is a foreign key that references the `user` table.
-- `movie_id` is a foreign key that references the `movie` table.
CREATE TABLE user_diary_to_track_watched_films (
  user_id INT,
  movie_id INT,
  rating_out_of_ten INT,
  watched_via ENUM('Streaming', 'Theatre', 'Owned', 'Rental'),
  rewatch BOOLEAN,
  date_watched DATE,
  PRIMARY KEY (user_id, movie_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (movie_id) REFERENCES movie(movie_id)
);
;
-- =======================================================================
-- Example of how to execute queries
-- =======================================================================

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:30:02
 *    DB   : qperkins_project
 */
INSERT INTO genre (genre_id, genre_title) VALUES
  (1, 'Action'),
  (2, 'Horror'),
  (3, 'Sci-Fi');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:30:52
 *    DB   : qperkins_project
 */
INSERT INTO movie_franchise (franchise_id, franchise_title) VALUES
  (1, 'Spider Man'),
  (2, 'Scream'),
  (3, 'Blade Runner');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:32:47
 *    DB   : qperkins_project
 */
INSERT INTO movie (movie_id, movie_title, genre_id, franchise_id, runtime, language, release_date, parental_rating) VALUES
  (1, 'Spider Man 1', 1, 1, 121, 'English', '2002-05-03', 'PG-13'),
  (2, 'Spider Man 2', 1, 1, 127, 'English', '2004-06-30', 'PG-13'),
  (3, 'Spider Man 3', 1, 1, 139, 'English', '2007-05-04', 'PG-13'),
  (4, 'Scream', 2, 2, 111, 'English', '1996-12-20', 'R'),
  (5, 'Scream 2', 2, 2, 120, 'English', '1997-12-12', 'R'),
  (6, 'Scream 3', 2, 2, 116, 'English', '2000-02-04', 'R'),
  (7, 'Blade Runner', 3, 3, 117, 'English', '1982-06-25', 'R'),
  (8, 'Blade Runner 2049', 3, 3, 164, 'English', '2017-10-06', 'R');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:36:23
 *    DB   : qperkins_project
 */
INSERT INTO person (person_id, first_name, last_name, gender, birthdate) VALUES
  (1, 'Tobey', 'Maguire', 'M', '1975-06-27'),
  (2, 'Kirsten', 'Dunst', 'F', '1982-04-30'),
  (3, 'Sam', 'Raimi', 'M', '1959-10-23');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:36:32
 *    DB   : qperkins_project
 */
INSERT INTO credit (credit_id, movie_id, person_id, credit_type, role) VALUES
  (1, 1, 1, 'Cast', 'Peter Parker'),
  (2, 1, 2, 'Cast', 'Mary Jane Watson'),
  (3, 1, 3, 'Crew', 'Director');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:37:30
 *    DB   : qperkins_project
 */
INSERT INTO user (user_id, user_first_name, user_last_name) VALUES
  (1, 'Quin', 'Perkins'),
  (2, 'Maddox', 'Tabalba'),
  (3, 'John', 'Perkins');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:37:40
 *    DB   : qperkins_project
 */
INSERT INTO watchlist (movie_id, user_id) VALUES
  (1, 1),
  (2, 1),
  (1, 2);;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:37:48
 *    DB   : qperkins_project
 */
INSERT INTO user_subscriptions (user_id, streaming_title) VALUES
  (1, 'Netflix'),
  (2, 'Hulu'),
  (3, 'Amazon Prime');;

/* Execution Failed */

/* ================================= */

/* Query run at 2023-03-20 02:38:00
 *    DB   : qperkins_project
 */
INSERT INTO streaming_service (streaming_title) VALUES
  ('Netflix'),
  ('Hulu'),
  ('Amazon Prime');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:38:09
 *    DB   : qperkins_project
 */
INSERT INTO user_diary_to_track_watched_films (user_id, movie_id, rating_out_of_ten, watched_via, rewatch, date_watched) VALUES
  (1, 1, 8, 'Streaming', 0, '2022-03-01'),
  (1, 2, 7, 'Theatre', 0, '2022-03-15'),
  (2, 1, 6, 'Streaming', 1, '2022-03-05');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:38:17
 *    DB   : qperkins_project
 */
INSERT INTO user_subscriptions (user_id, streaming_title) VALUES
  (1, 'Netflix'),
  (2, 'Hulu'),
  (3, 'Amazon Prime');;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:38:26
 *    DB   : qperkins_project
 */
INSERT INTO streaming_library (streaming_title, movie_id) VALUES
  ('Netflix', 1),
  ('Netflix', 2),
  ('Hulu', 3);;

/* Non-Returning Query Executed */

/* ================================= */

/* Query run at 2023-03-20 02:39:04
 *    DB   : qperkins_project
 */
SELECT * FROM movie;

/* QUERY RESULTS
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
| movie_id | movie_title       | genre_id | franchise_id | runtime | language | release_date | parental_rating |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
|        1 | Spider Man 1      |        1 |            1 |     121 | English  | 2002-05-03   | PG-13           |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
|        2 | Spider Man 2      |        1 |            1 |     127 | English  | 2004-06-30   | PG-13           |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
|        3 | Spider Man 3      |        1 |            1 |     139 | English  | 2007-05-04   | PG-13           |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
|        4 | Scream            |        2 |            2 |     111 | English  | 1996-12-20   | R               |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
|        5 | Scream 2          |        2 |            2 |     120 | English  | 1997-12-12   | R               |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
|        6 | Scream 3          |        2 |            2 |     116 | English  | 2000-02-04   | R               |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
|        7 | Blade Runner      |        3 |            3 |     117 | English  | 1982-06-25   | R               |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
|        8 | Blade Runner 2049 |        3 |            3 |     164 | English  | 2017-10-06   | R               |
+----------+-------------------+----------+--------------+---------+----------+--------------+-----------------+
Row Count: 8
*/

/* ================================= */

/* Query run at 2023-03-20 02:39:11
 *    DB   : qperkins_project
 */
SELECT * FROM genre;

/* QUERY RESULTS
+----------+-------------+
| genre_id | genre_title |
+----------+-------------+
|        1 | Action      |
+----------+-------------+
|        2 | Horror      |
+----------+-------------+
|        3 | Sci-Fi      |
+----------+-------------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:39:19
 *    DB   : qperkins_project
 */
SELECT * FROM movie_franchise;

/* QUERY RESULTS
+--------------+-----------------+
| franchise_id | franchise_title |
+--------------+-----------------+
|            1 | Spider Man      |
+--------------+-----------------+
|            2 | Scream          |
+--------------+-----------------+
|            3 | Blade Runner    |
+--------------+-----------------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:39:26
 *    DB   : qperkins_project
 */
SELECT * FROM person;

/* QUERY RESULTS
+-----------+------------+-----------+--------+------------+
| person_id | first_name | last_name | gender | birthdate  |
+-----------+------------+-----------+--------+------------+
|         1 | Tobey      | Maguire   | M      | 1975-06-27 |
+-----------+------------+-----------+--------+------------+
|         2 | Kirsten    | Dunst     | F      | 1982-04-30 |
+-----------+------------+-----------+--------+------------+
|         3 | Sam        | Raimi     | M      | 1959-10-23 |
+-----------+------------+-----------+--------+------------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:39:33
 *    DB   : qperkins_project
 */
SELECT * FROM credit;

/* QUERY RESULTS
+-----------+----------+-----------+-------------+------------------+
| credit_id | movie_id | person_id | credit_type | role             |
+-----------+----------+-----------+-------------+------------------+
|         1 |        1 |         1 | Cast        | Peter Parker     |
+-----------+----------+-----------+-------------+------------------+
|         2 |        1 |         2 | Cast        | Mary Jane Watson |
+-----------+----------+-----------+-------------+------------------+
|         3 |        1 |         3 | Crew        | Director         |
+-----------+----------+-----------+-------------+------------------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:39:42
 *    DB   : qperkins_project
 */
SELECT * FROM user;

/* QUERY RESULTS
+---------+-----------------+----------------+
| user_id | user_first_name | user_last_name |
+---------+-----------------+----------------+
|       1 | Quin            | Perkins        |
+---------+-----------------+----------------+
|       2 | Maddox          | Tabalba        |
+---------+-----------------+----------------+
|       3 | John            | Perkins        |
+---------+-----------------+----------------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:39:49
 *    DB   : qperkins_project
 */
SELECT * FROM watchlist;

/* QUERY RESULTS
+----------+---------+
| movie_id | user_id |
+----------+---------+
|        1 |       1 |
+----------+---------+
|        1 |       2 |
+----------+---------+
|        2 |       1 |
+----------+---------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:40:07
 *    DB   : qperkins_project
 */
SELECT * FROM streaming_service;

/* QUERY RESULTS
+-----------------+
| streaming_title |
+-----------------+
| Amazon Prime    |
+-----------------+
| Hulu            |
+-----------------+
| Netflix         |
+-----------------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:40:16
 *    DB   : qperkins_project
 */
SELECT * FROM streaming_library;

/* QUERY RESULTS
+-----------------+----------+
| streaming_title | movie_id |
+-----------------+----------+
| Hulu            |        3 |
+-----------------+----------+
| Netflix         |        1 |
+-----------------+----------+
| Netflix         |        2 |
+-----------------+----------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:40:27
 *    DB   : qperkins_project
 */
SELECT * FROM user_subscriptions;

/* QUERY RESULTS
+---------+-----------------+
| user_id | streaming_title |
+---------+-----------------+
|       1 | Netflix         |
+---------+-----------------+
|       2 | Hulu            |
+---------+-----------------+
|       3 | Amazon Prime    |
+---------+-----------------+
Row Count: 3
*/

/* ================================= */

/* Query run at 2023-03-20 02:40:43
 *    DB   : qperkins_project
 */
SELECT * FROM user_diary_to_track_watched_films;

/* QUERY RESULTS
+---------+----------+-------------------+-------------+---------+--------------+
| user_id | movie_id | rating_out_of_ten | watched_via | rewatch | date_watched |
+---------+----------+-------------------+-------------+---------+--------------+
|       1 |        1 |                 8 | Streaming   |       0 | 2022-03-01   |
+---------+----------+-------------------+-------------+---------+--------------+
|       1 |        2 |                 7 | Theatre     |       0 | 2022-03-15   |
+---------+----------+-------------------+-------------+---------+--------------+
|       2 |        1 |                 6 | Streaming   |       1 | 2022-03-05   |
+---------+----------+-------------------+-------------+---------+--------------+
Row Count: 3
*/

/* ================================= */
