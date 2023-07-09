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

#11 From the following table, write a SQL query to find orders that are delivered by a salesperson with ID. 5001. Return ord_no, ord_date, purch_amt. 
SELECT ord_no, ord_date, purch_amt FROM orders 
WHERE salesman_id=5001;
#--------------------------------------------
# ADD NEW TABLE
CREATE TABLE nobel_win(
    id INT PRIMARY KEY AUTO_INCREMENT,
    year int,
    subject VARCHAR(100),
    winner VARCHAR(100),
    country VARCHAR(100),
    category VARCHAR(100)
);

INSERT INTO nobel_win(year, subject, winner, country, category) 
VALUES  (1970, 'Physics','Hannes','Sweden','Scientist'),
        (1970, 'Physics','Louis','France','Scientist'),
        (1970, 'Chemistry','Luis','France','Scientist'),
        (1970, 'Physiology','Euler','Sweden','Scientist'),
        (1970, 'Physiology','Bernard','Germany','Scientist'),
        (1970, 'Literature','Aleksandr','Russia','Linguist'),
        (1970, 'Economics','Paul','USA','Economist'),
        (1970, 'Physiology','Julius','USA','Scientist'),
        (1971, 'Physics','Dennis','Hungary','Scientist'),
        (1971, 'Chemistry','Gerhard','Germany','Chancellor'),
        (1971, 'Peace','Willy','Germany','Linguist'),
        (1971, 'Literature','Pablo','Chile','Linguist'),
        (1971, 'Economics','Simon','Russia','Economist');
#------------------------------------------------

#12 From the following table, write a SQL query to find the Nobel Prize winner(s) for the year 1970. Return year, subject and winner. 
SELECT year, subject, winner 
    FROM nobel_win
WHERE year=1970;

#13 From the following table, write a SQL query to find the Nobel Prize winner in ‘Literature’ for 1971. Return winner. 
SELECT winner 
    FROM nobel_win
WHERE year=1971
    AND subject = 'Literature';

#14 From the following table, write a SQL query to locate the Nobel Prize winner 'Dennis Gabor'. Return year, subject.
SELECT year, subject 
    FROM nobel_win
WHERE winner='Dennis';

#15 From the following table, write a SQL query to find the Nobel Prize winners in the field of ‘Physics’ since 1950. Return winner. 
SELECT winner
    FROM nobel_win
WHERE year>=1950
    AND subject='Physics';

#16 From the following table, write a SQL query to find the Nobel Prize winners in ‘Chemistry’ between the years 1965 and 1975. Begin and end values are included. Return year, subject, winner, and country.  
SELECT year, subject, winner, country 
    FROM nobel_win
WHERE subject='Chemistry'
    AND year>1965 AND YEAR <1975;

#17  Write a SQL query to display all details of the Prime Ministerial winners after 1972 of Menachem Begin and Yitzhak Rabin.  
SELECT *
FROM nobel_win
    WHERE year > 1972
        AND winner IN ('Menachem Begin', 'Yitzhak Rabin');

#18 From the following table, write a SQL query to retrieve the details of the winners whose first names match with the string ‘Louis’. Return year, subject, winner, country, and category. 
SELECT *
    FROM nobel_win
        WHERE winner LIKE 'Louis %';

#19 From the following table, write a SQL query that combines the winners in Physics, 1970 and in Economics, 1971. Return year, subject, winner, country, and category. 
SELECT * 
    FROM nobel_win
        WHERE (subject='Physics' AND year=1970) 
UNION (
SELECT * 
    FROM nobel_win 
        WHERE (subject ='Economics' AND YEAR=1971)
);

#20 From the following table, write a SQL query to find the Nobel Prize winners in 1970 excluding the subjects of Physiology and Economics. Return year, subject, winner, country, and category.
SELECT * 
    FROM nobel_win
        WHERE year=1970
            AND subject NOT IN('Physiology','Economics');

#21 From the following table, write a SQL query to combine the winners in 'Physiology' before 1971 and winners in 'Peace' on or after 1974. Return year, subject, winner, country, and category. 
SELECT * 
    FROM nobel_win
        WHERE (subject='Physiology' AND year<1971)
UNION(
SELECT * 
    FROM nobel_win
        WHERE (subject='Peace' AND year>=1974)
);

#22 From the following table, write a SQL query to find the details of the Nobel Prize winner 'Johannes Georg Bednorz'. Return year, subject, winner, country, and category. 
SELECT * 
    FROM nobel_win
        WHERE winner='Johannes Georg Bednorz';

#23 From the following table, write a SQL query to find Nobel Prize winners for the subject that does not begin with the letter 'P'. Return year, subject, winner, country, and category. Order the result by year, descending and winner in ascending.  
SELECT * 
    FROM nobel_win
        WHERE subject NOT LIKE 'P%'
            ORDER BY year DESC, winner ASC;

#24 From the following table, write a SQL query to find the details of 1970 Nobel Prize winners. Order the results by subject, ascending except for 'Chemistry' and ‘Economics’ which will come at the end of the result set. Return year, subject, winner, country, and category.
SELECT *
    FROM nobel_win
WHERE year=1970
ORDER BY
    CASE 
        WHEN subject IN ('Economics','Chemistry') THEN 1  
        ELSE 0
    END ASC,
    subject,
    winner ;
        
#-----------------------------------
# ADD NEW TABLE
CREATE TABLE item_mast(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    price float,
    com INT
);
DESC item_mast;
INSERT INTO item_mast(id, name, price, com)
VALUES  (101, 'Mother Board', 3200.00, 15),
        (102, 'Key Board', 450.00, 16),
        (103, 'ZIP Drive', 250.00, 14),
        (104, 'Speaker', 550.00, 16),
        (105, 'Monitor', 5000.00, 11),
        (106, 'DVD drive', 900.00, 12),
        (107, 'CD drive', 800.00, 12),
        (108, 'Printer', 2600.00, 13),
        (109, 'Refill cartridge', 350.00, 13);
SELECT * FROM item_mast;
#----------------------------------------------

#25 From the following table, write a SQL query to select a range of products whose price is in the range Rs.200 to Rs.600. Begin and end values are included. Return pro_id, pro_name, pro_price, and pro_com.
SELECT * FROM item_mast
    WHERE price BETWEEN 200 AND 600;

#26 From the following table, write a SQL query to calculate the average price for a manufacturer code of 16. Return avg.   
SELECT AVG(price) FROM item_mast
    WHERE com=16;

#27 From the following table, write a SQL query to display the pro_name as 'Item Name' and pro_priceas 'Price in Rs.'  
SELECT name AS "Item Name", price AS "Price in Rs." 
    FROM item_mast;

#28 From the following table, write a SQL query to find the items whose prices are higher than or equal to $250. Order the result by product price in descending, then product name in ascending. Return pro_name and pro_price.  
SELECT name, price 
    FROM item_mast
        WHERE price >=250
            ORDER BY price desc, name;

#29 From the following table, write a SQL query to calculate average price of the items for each company. Return average price and company code. 
SELECT AVG(price), com
    FROM item_mast
GROUP BY com;

#30 From the following table, write a SQL query to find the cheapest item(s). Return pro_name and, pro_price.
SELECT name, price
    FROM item_mast
    WHERE price = (SELECT MIN(price) FROM item_mast);

#-----------------------
# ADD NEW TABLE
CREATE TABLE emp_details(
    id INT,
    fname VARCHAR(20),
    lname VARCHAR(20),
    dept INT
);

INSERT INTO emp_details(id, fname, lname, dept) 
VALUES  (127323, 'Michale', 'Robbin', 57),
        (52689, 'Carlos', 'Snares', 63),
        (843795, 'Enric', 'Dosio', 57),
        (328717, 'John', 'Snares', 63),
        (444527, 'Joseph', 'Dosni', 47),
        (659831, 'Zanifer', 'Emily', 47),
        (847674, 'Kuleswar', 'Sitaraman', 57),
        (748681, 'Henrey', 'Gabriel', 47),
        (631548, 'Alan', 'Snappy', 27);
SELECT * FROM emp_details;
#-----------------------------------------------

#31 From the following table, write a SQL query to find the unique last name of all employees. Return emp_lname.  
SELECT DISTINCT lname
FROM emp_details;

#32 From the following table, write a SQL query to find the details of employees whose last name is 'Snares'. Return emp_idno, emp_fname, emp_lname, and emp_dept.  
SELECT * FROM emp_details
    WHERE lname='Snares';

#33 From the following table, write a SQL query to retrieve the details of the employees who work in the department 57. Return emp_idno, emp_fname, emp_lname and emp_dept.
SELECT * FROM emp_details
   WHERE dept=57;