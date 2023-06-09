-- create a new database called sakila
CREATE DATABASE sakila;
-- using the newly created database called sakila
USE sakila;

-- create a table to store film related data 
-- title, release_date, description, rental_rate,
-- length, replacement_cost, ratings, special_features,
-- rental_status

CREATE TABLE film (
	title varchar(50),
    release_date date,
    description varchar(100),
    rental_rate int,
    length int,
    replacement_cost int,
    ratings double,
    special_features varchar(50),
    rental_status varchar(50)
);

-- query all the rows and columns from the table
select * from film;

-- insert some data into the table
INSERT INTO film ( 
	title, release_date, description,
    rental_rate, length, replacement_cost,
    ratings, special_features,
    rental_status ) 
VALUES (
	'The Dark Knight', '2008-07-18', 'Batman fights the Joker',
    10, 120, 50, 4.9, 'PG-13', 'Available'
);

-- INSERT INTO {tableName} (col1, col2, col3...)
-- VALUES ( val1, val2, val3....) 

-- specifying columns becomes optional if we are inserting data in all the columns

INSERT INTO film VALUES (
	'The Dark Knight Rises', '2012-07-20', 'Batman fights the Bane',
    10, 120, 50, 4.9, 'PG-13', 'Available'
);

-- even though, its optional, still keep the names 
-- if we want to insert for some specific columns then column names will be mandatory

INSERT INTO film ( 
	title, release_date, description, 
    length, special_features,
    rental_status ) 
VALUES (
	'Oppenhiemer', '2023-07-21', 'Story of Robert Oppenheimer and invention of atom bomb',
     120,'PG-13', 'Not Released'
);

INSERT INTO film VALUES (
	  'Jawan', '2023-09-07', 'SRK is Jawan',
      null, 134, null, null, 'PG-13', 'Not Released'
);

INSERT INTO film VALUES (
	  'DDLJ', '1995-10-20', 'SRK and Kajol getting married',
      5, 160, 35, 5, 'PG-13', 'Available'
);

INSERT INTO film VALUES (
	  'Kal Ho na Ho', '2003-11-28', 'SRK dies due to heart issues',
      7, 150, 30, 4.8, 'PG-13', 'Available'
);

INSERT INTO film VALUES (
	  'Joker', '2019-10-02', 'Epic Movie on the best super villan ever',
      12, 120, 65, 5, 'PG-18', 'Available'
);

INSERT INTO film VALUES (
	  'RRR', '2022-03-24', 'Epic battle between two major characters',
      870, 120, 45, 4.9, 'PG-13', 'Available'
);

-- let us imagine, that this table has a auto generating filmId column at the beginning
-- INSERT INTO film VALUES (
-- 		default, 'Jawan', '2023-09-07', 'SRK is Jawan',
--      null, 134, null, null, 'PG-13', 'Not Released'
-- );

-- SQL is case-insensitive
sEleCT * frOM fILm;


-- READ 

-- querying all data (all rows and columns)
select * from film;

-- query some specific columns 
select title, description, release_date from film;

-- query some specific rows 
select * from film where rental_rate = 10;

-- query specific columns and specific rows 
select title, description, release_date from film
where rental_rate = 10;

-- check the all unique movie lengths -> DISTINCT
SELECT DISTINCT length FROM film;

-- we can combine columns to form distinct combinations
SELECT DISTINCT length, ratings FROM film;

-- select can be used to print constant values as well
SELECT 'Hello World';

SELECT 5;


-- operations on columns 
SELECT title, length/60 FROM FILM;
SELECT title, ROUND(length/60) FROM FILM;

-- inserting some data from one table to another 

CREATE TABLE film_description (
	title varchar(50),
    release_date date,
    description varchar(100),
    length int,
    ratings double,
    special_features varchar(50)
);
-- read data from the table
SELECT * FROM film_description;

-- copy data from film table and insert in film_description table
INSERT INTO film_description
 (title, release_date, description, length, ratings,
	special_features) SELECT title, release_date, description,
    length, ratings, special_features FROM film;

-- no need to use VALUES keyword, as we are actually not passing any value

-- INSERT INTO newTable ( col1, col2, col3...) SELECT data from oldTable

-- AND, OR, NOT
select * from film;

-- for checking if a cell value is null, we write {columnName} IS NULL 
SELECT * FROM film WHERE rental_rate IS NULL;

SELECT * FROM film WHERE rental_rate IS NOT NULL;


SELECT * FROM film WHERE length <= 120 
AND rental_rate IS NOT NULL;


SELECT * FROM film WHERE length > 120 
OR rental_rate IS NOT NULL;

-- find all the films which have rental_rate of 10, 5 or 7 
SELECT * FROM film WHERE rental_rate = 10 OR rental_rate = 5 OR rental_rate = 7 OR 
rental_rate = 8;

SELECT * FROM film WHERE rental_rate IN (10,5,7,8);

-- find all the film whose length is between 100 - 120 
SELECT * FROM film WHERE length >= 100 AND length <= 120;

-- query through a range of values -> BETWEEN 
-- BETWEEN is an inclusive operator, so BETWEEN x AND y means,  >= x AND <= y
SELECT * FROM film WHERE length BETWEEN 100 AND 120;

-- query all the movies but by ratings, highest rating first 
SELECT * FROM film ORDER BY ratings DESC;

-- query all the movies but by rental, cheapest first
-- ORDER BY is by default ascending
SELECT * FROM film ORDER BY rental_rate; 

SELECT * FROM film ORDER BY title;

-- LIMIT -> limits the number of output rows

-- find the first movie with highest rating
SELECT * FROM film ORDER BY ratings DESC LIMIT 1;

-- find the first 3 movies with highest rating
SELECT * FROM film ORDER BY ratings DESC LIMIT 3;

-- query find the movies with best rating but cheapest rental rates 
-- order the data by best ratings, and then by cheapest rental rate
SELECT * FROM film ORDER BY ratings DESC, rental_rate;


-- UPDATING values 
UPDATE film SET rental_rate = 11 WHERE title = 'Oppenhiemer';

UPDATE film SET replacement_cost = 100, ratings = 5 WHERE title = 'Oppenhiemer';

-- UPDATE tableName SET col1 = val1, col2 = val2.... WHERE rowFilterCondition

-- DELETING values 
DELETE FROM film WHERE title='RRR';

-- task 1 -> 
-- a. try updating without any where clause
-- b. try update with where clause using IN and BETWEEN operators 

-- task 2 -> 
-- a. figure out how to delete all the data in a table 
-- b. figure out the difference between truncate and drop for a table. 

