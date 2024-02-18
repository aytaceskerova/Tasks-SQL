
--1
SELECT * FROM customer
WHERE grade>100
--2
SELECT * FROM customer
WHERE city = 'New york' and grade>100
--3
SELECT * FROM customer
WHERE city = 'New york' OR grade>100
--4
SELECT *FROM customer
WHERE city = 'New york' OR grade <= 100
--5
SELECT *FROM customer
WHERE city!='New york' or grade>100
--7
SELECT * FROM orders
WHERE order_date >='2016-02-10' and customer_id <3009
--6
SELECT * FROM orders
WHERE order_date='2016-02-10' and salesman_id >5005 OR purch_amt >1000
--7
SELECT * FROM orders
WHERE purch_amt<200 OR( customer_id<3009 AND order_date >='2016-08-17')
SELECT * FROM orders
WHERE purch_amt < 200 OR (order_date >= '2012-02-10' AND customer_id >= 3009);

--9

--10
SELECT * FROM employeess
WHERE EMP_LNAME IN ('Dosni', 'Mardy')
--11
SELECT * FROM employeess
WHERE EMP_DEPT IN (47, 63);
