USE sakila;

CREATE TABLE student (
	id int,
    name varchar(100),
    phoneNumber varchar(15),
    batchId int
);

CREATE TABLE batch (
	id int,
    name varchar(100)
);

SELECT * FROM student;
SELECT * FROM batch;

INSERT INTO batch (id, name) VALUES ( 1, "Apr22");
INSERT INTO batch (id, name) VALUES ( 2, "May22");
INSERT INTO batch (id, name) VALUES ( 3, "June22");
INSERT INTO batch (id, name) VALUES ( 4, "July22");
INSERT INTO batch (id, name) VALUES ( 5, "Aug22");
INSERT INTO batch (id, name) VALUES ( 8, "Aug23");
INSERT INTO batch (id, name) VALUES ( 9, "Oct23");
INSERT INTO batch (id, name) VALUES ( 12, "Nov23");

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (1, "Kiran", "1234", 1);

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (2, "Sagar", "1001", 2);

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (3, "Rahul", "2345", 1);

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (4, "Prasanth", "4521", 2);

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (5, "Hitesh", "1924", 3);

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (6, "Mayur", "0001", 1);

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (7, "Navin", "2001", 6);

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (8, "Venkat", "2002", 10);

INSERT INTO student(id, name, phoneNumber, batchId) 
VALUES (9, "Tushar", "1234", 11);


-- joining 
SELECT * FROM student
INNER JOIN batch
ON student.batchId = batch.id;

-- query student name using batchName
SELECT student.name, batch.name FROM student
INNER JOIN batch
ON student.batchId = batch.id 
WHERE batch.name = "Apr22";

-- use table alias to make the query shorter
-- inner keyword is optional, only joins keyword will lead to inner joins 
SELECT s.name, b.name FROM batch b
JOIN student s
ON s.batchId = b.id 
WHERE b.name = "Apr22";

-- we can create alias names for columns for better readability
SELECT s.name as studentName, b.name as batchName FROM batch b
JOIN student s
ON s.batchId = b.id 
WHERE b.name = "Apr22";

-- query batchId, batchName using student Name
SELECT student.name, batch.id, batch.name FROM student
INNER JOIN batch
ON student.batchId = batch.id 
WHERE student.name = "Kiran";

-- student_PeerReviewer table
CREATE TABLE student_reviewer (
	id int,
    name varchar(100),
    peerReviewerId int
);

SELECT * FROM student_reviewer;

INSERT INTO student_reviewer(id, name, peerReviewerId) VALUES (1, "A" , 6);
INSERT INTO student_reviewer(id, name, peerReviewerId) VALUES (2, "B" , 3);
INSERT INTO student_reviewer(id, name, peerReviewerId) VALUES (3, "C" , 4);
INSERT INTO student_reviewer(id, name, peerReviewerId) VALUES (4, "D" , 1);
INSERT INTO student_reviewer(id, name, peerReviewerId) VALUES (5, "E" , 2);
INSERT INTO student_reviewer(id, name, peerReviewerId) VALUES (6, "F" , 5);


-- self join to get the student name and peerReviewer name 
SELECT s.name as StudentName, r.name as PeerReviewerName
FROM student_reviewer s
JOIN student_reviewer r
ON s.peerReviewerId = r.id ORDER BY s.id;

SELECT r.name as StudentName, s.name as PeerReviewerName
FROM student_reviewer s
JOIN student_reviewer r
ON s.id = r.peerReviewerId ORDER BY s.id;


-- adding instructorId column in batches table
ALTER TABLE batch ADD instructorId int;

UPDATE batch SET instructorId = 1 WHERE id IN (1,3,5);
UPDATE batch SET instructorId = 2 WHERE id IN (2,4);
UPDATE batch SET instructorId = 3 WHERE id IN (8,9,12);

SELECT * FROM BATCH;
SELECT * FROM STUDENT;

-- instructor table
CREATE TABLE instructor (
	id int,
    name varchar(100)
);
SELECT * FROM INSTRUCTOR;

INSERT INTO instructor (id, name) VALUES ( 1, "Sandeep");
INSERT INTO instructor (id, name) VALUES ( 2, "Naman");

-- print student name and instructor name
SELECT s.name AS StudentName, i.name AS InstructorName
FROM Student s
JOIN Batch b
ON s.batchId = b.id
JOIN Instructor i
ON b.instructorId = i.id;


select s.name, i.name from student s join 
batch b join instructor i on s.batchId=b.id and b.instructorId=i.id;

-- OUTER JOINS 

-- LEFT JOIN 
SELECT * FROM student s
LEFT JOIN batch b
on s.batchId = b.id;

-- RIGHT JOIN 
SELECT * FROM student s
RIGHT JOIN batch b
on b.id = s.batchid ORDER BY b.id;

-- FULL OUTER JOIN  -> FULL OUTER JOIN NOT PRESENT IN MYSQL 
-- SELECT * FROM student s 
-- FULL JOIN batch b
-- on s.batchId = b.id;

