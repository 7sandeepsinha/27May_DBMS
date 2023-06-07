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
