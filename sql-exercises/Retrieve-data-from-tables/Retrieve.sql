#Setup
CREATE DATABASE sql_exercise;
SHOW DATABASES;
USE sql_exercise;
CREATE TABLE salesman(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    commission FLOAT
);
SHOW TABLES;
DESC salesman;
INSERT INTO salesman(id, name, city, commission) 
VALUES  (5001, 'James', 'New York', '0.15'), 
        (5002, 'Nail', 'Paris', '0.13'),
        (5005, 'Pit', 'London', '0.11'), 
        (5006, 'Lyon', 'Paris', '0.14'),
        (5007, 'Paul', 'Rome', '0.13'), 
        (5003, 'Lauson', 'San Jose', '0.12');

#----------------------------------------------

#1 Write a SQL statement that displays all the information about all salespeople
SELECT * FROM salesman;

#2 Write a query to display a string "This is SQL Exercise, Practice and Solution".
SELECT "This is SQL Exercise, Practice and Solution";

#3 Write a SQL query to display three numbers in three columns. 
SELECT 5, 10, 15;

#4 Write a SQL query to display the sum of two numbers 10 and 15 from the RDBMS server. 
SELECT 10+15;

#5 Write an SQL query to display the result of an arithmetic expression. 
SELECT 10 + 5 - 4 * 2;

#6 Write a SQL statement to display specific columns such as names and commissions for all salespeople. 
SELECT name as Names, commission as Commissions FROM salesman;

#----------------------------------
# ADD NEW TABLE
CREATE TABLE orders(
    ord_no INT PRIMARY KEY,
    purch_amt FLOAT,
    ord_date DATE,
    customer_id INT,
    salesman_id INT
);
DESC orders;
ALTER TABLE orders
ADD CONSTRAINT fk_order_salesman_id
Foreign Key (salesman_id) REFERENCES salesman(id);

INSERT INTO orders(ord_no, purch_amt, ord_date, customer_id, salesman_id) 
VALUES  (70001, 150.5, '2012-10-05', 3005, 5002),
        (70009, 270.65, '2012-09-10', 3001, 5005),
        (70002, 65.26, '2012-10-05', 3002, 5001),
        (70004, 110.5, '2012-08-17', 3009, 5003),
        (70007, 948.5, '2012-09-10', 3005, 5002),
        (70005, 2400.6, '2012-07-27', 3007, 5001),
        (70008, 5760, '2012-09-10', 3002, 5001),
        (70010, 1983.43, '2012-10-10', 3004, 5006),
        (70003, 2480.4, '2012-10-10', 3009, 5003),
        (70012, 250.45, '2012-06-27', 3008, 5002),
        (70011, 75.29, '2012-08-17', 3003, 5007),
        (70013, 3045.6, '2012-04-25', 3002, 5001);
TRUNCATE orders;
SELECT * FROM orders;
#-------------------------------

#7 Write a query to display the columns in a specific order, such as order date, salesman ID, order number, and purchase amount for all orders.   
SELECT ord_date, salesman_id, ord_no,purch_amt FROM orders;

#8 From the following table, write a SQL query to identify "THE UNIQUE" salespeople ID. Return salesman_id.
SELECT DISTINCT salesman_id 
FROM orders;

#9 From the following table, write a SQL query to locate salespeople who live in the city of 'Paris'. Return salespersons name, city.
SELECT name, city
FROM salesman WHERE city='Paris';

CREATE TABLE customer(
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    city VARCHAR(100),
    grade INT,
    salesman_id INT
);
DESC customer;
INSERT INTO customer(customer_id, cust_name, city, grade, salesman_id) 
VALUES  (3002, 'Nick', 'New York', 100, 5001),
        (3007, 'Brad Davis', 'New York', 200, 5001),
        (3005, 'Graham', 'California', 100, 5002),
        (3008, 'Julian', 'London', 300, 5002),
        (3004, 'Fabian', 'Paris', 300, 5006),
        (3009, 'Geoff', 'Berlin', 100, 5003),
        (3003, 'Jozy', 'Moscow', 200, 5007);
INSERT INTO customer(customer_id, cust_name, city, salesman_id) 
VALUES (3001, 'Brad Guzan', 'London',  5005);

SELECT * FROM customer;
#----------------------------------------------------------

#10 From the following table, write a SQL query to find customers whose grade is 200. Return customer_id, cust_name, city, grade, salesman_id. 
SELECT * FROM customer
WHERE grade=200;