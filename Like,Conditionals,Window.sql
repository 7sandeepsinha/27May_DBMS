use sakila;

CREATE TABLE Sales (
  id INT,
  product VARCHAR(50),
  category VARCHAR(50),
  amount DECIMAL(10,2)
);

SELECT * from Sales;

INSERT INTO Sales (id, product, category, amount)
VALUES
  (1, 'Product A', 'Category X', 100.50),
  (2, 'Product B', 'Category Y', 75.25),
  (3, 'Product C', 'Category X', 50.75),
  (4, 'Product D', 'Category Y', 120.00),
  (5, 'Product E', 'Category Z', 90.00);
  
-- average amount for each category with category name using window

SELECT
  id,
  product,
  category,
  amount,
  AVG(amount) OVER (PARTITION BY category) AS average_amount,
  SUM(amount) OVER (PARTITION BY product) AS total_amount
FROM
  Sales;
  
-- average amount of category with category name using group by

SELECT category, AVG(amount) FROM Sales GROUP BY category;


-- RANK 
-- Gives you the relative position of a row compared to other rows over a specific column value

CREATE TABLE StudentScore (
  id INT,
  name VARCHAR(50),
  score INT
);

INSERT INTO StudentScore (id, name, score)
VALUES
  (1, 'John', 85),
  (2, 'Emily', 92),
  (3, 'Michael', 78),
  (4, 'Sarah', 92),
  (5, 'David', 80);
  
SELECT * FROM StudentScore;

-- rank of each student basis of their score 

SELECT
  id,
  name,
  score,
  RANK() OVER (ORDER BY score DESC) AS studentRank
FROM
  StudentScore;
  
  SELECT
  id,
  name,
  score,
  DENSE_RANK() OVER (ORDER BY score DESC) AS studentRank
FROM
  StudentScore;

-- RANK() -> skips values in case of duplicate ranks 
-- DENSE_RANK() -> will not skip values in case of duplicate ranks 

-- IF/ELSE conditionals in SQL 

CREATE TABLE Employees (
  id INT,
  name VARCHAR(50),
  age INT,
  salary DECIMAL(10,2)
);

INSERT INTO Employees (id, name, age, salary)
VALUES
  (1, 'John', 30, 5000.00),
  (2, 'Emily', 35, 6000.00),
  (3, 'Michael', 25, 4500.00);
  
SELECT * from Employees;

UPDATE Employees
SET salary = IF(age < 30, IF(salary<5000, salary * 1.20, salary * 1.10), salary * 1.05);

SELECT name, age, IF(age < 30 ,"10% hike", "5% hike") as HIKE from Employees;


ALTER TABLE Employees ADD EMAIL VARCHAR(250);

UPDATE Employees SET EMAIL = "Michael@email.com" WHERE id = 3;

INSERT INTO Employees VALUES (4, 'Emilia', 28, 5000, 'Emilia@email.com');

-- LIKE used to search for part of string, expression 

SELECT *
FROM Employees
WHERE email LIKE '%h%@email.com';

-- Dont use LIKES in practical scenario as it is very slow 

-- If search is with a particular expression -> indexing 
-- If search is with complete random expressions -> Elastic Search
