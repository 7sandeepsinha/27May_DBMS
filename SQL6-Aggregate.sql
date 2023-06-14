USE sakila;

SELECT * FROM student;

-- adding psp and scaler coin columns in student
ALTER TABLE student ADD psp int;
ALTER TABLE student ADD coins int;

UPDATE student set coins = 200 WHERE id NOT IN (1,2,3,4);
UPDATE student set psp = 85 WHERE id NOT IN (1,2,3,4);

INSERT INTO student(id, name, phoneNumber, batchId, psp, coins)
VALUES (10,null,3456,2,80,90);

INSERT INTO student(id, name, phoneNumber, batchId, psp, coins)
VALUES (null,null,null,null,null,null);

SELECT * FROM student ORDER BY batchId;

-- find the total number of students
SELECT COUNT(*) AS TotalStudents FROM student;

-- find the total number of students with batchId 2 
SELECT COUNT(name) FROM student WHERE batchId = 2;

-- find avg psp for all students
SELECT AVG(psp) FROM student;

-- find the avg psp for all students by their batches 
SELECT batchId, avg(psp) AS AverageBatchPsp 
FROM student 
GROUP BY batchId;

-- find the avg psp for all students by their batches avg > 80
SELECT batchId, avg(psp)  
FROM student 
GROUP BY batchId
HAVING avg(psp) > 80;

SELECT batchId AS StudentBatchId, avg(psp) AS AvgBatchPSP 
FROM student 
GROUP BY batchId
HAVING AvgBatchPSP > 80;


-- find the avg psp for all students by their batches avg > 80
SELECT name, max(psp)  
FROM student 
GROUP BY batchId;

-- I have one question for every batch I want to show student name and psp whose psp is maximum among batch
