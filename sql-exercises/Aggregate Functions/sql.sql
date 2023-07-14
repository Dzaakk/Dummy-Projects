use sql_exercise;


#1 From the following table, write a SQL query to calculate total purchase amount of all orders. Return total purchase amount. 
SELECT SUM (purch_amt) AS 'Total Purchase Amount' 
FROM orders;

#2 From the following table, write a SQL query to calculate the average purchase amount of all orders. Return average purchase amount. 
SELECT AVG(purch_amt) FROM orders;

#3 From the following table, write a SQL query that counts the number of unique salespeople. Return number of salespeople.  
SELECT COUNT (DISTINCT salesman_id) 
FROM orders;

#4 From the following table, write a SQL query to count the number of customers. Return number of customers. 
SELECT COUNT(*) FROM customer;

#5 From the following table, write a SQL query to determine the number of customers who received at least one grade for their activity.   
SELECT  COUNT (ALL grade)
FROM customer;