#1 From the following table, write a SQL query to select all the salespeople. Return salesman_id, name, city, commission with the percent sign (%).
SELECT id, name, city , '%', commission*100
FROM salesman;

#2 From the following table, write a SQL query to find the number of orders booked for each day. Return the result in a format like "For 2001-10-10 there are 15 orders"."."
SELECT ' For',ord_date,',there are', COUNT(ord_no),'orders.' 
FROM orders 
GROUP BY ord_date;

#3 From the following table, write a SQL query to find all the orders. Sort the result-set in ascending order by ord_no. Return all fields.
SELECT * FROM orders
GROUP BY ord_no;