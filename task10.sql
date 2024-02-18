
select * from customer
select * from salesman
select * from orders
--1
SELECT 
		c.customer_name,
		s.name,
		s.city
FROM customer c
JOIN salesman s  
ON c.city = s.city

--2
SELECT 
		c.customer_name,
		s.name
FROM customer c
JOIN salesman s
ON c.salesman_id = s.salesman_id

---3
SELECT 
		o.order_no,
		c.customer_name,
		o.customer_id,
		o.salesman_id
FROM orders o
JOIN customer c
ON o.customer_id = c.customer_id
JOIN salesman s
ON o.salesman_id = s.salesman_id
WHERE c.city!=s.city
--4
SELECT
c.customer_name AS "Customer",
c.grade AS "Grade"
FROM customer c
JOIN salesman s
ON c.salesman_id = s.salesman_id
--5
SELECT
c.customer_name AS "Customer", 
c.city AS "City"FROM customer cJOIN salesman sON c.salesman_id = c.salesman_idWHERE s.comission between 0.12 AND 0.14--6SELECT  c.customer_name,
 s.comission*100 as "Commission%" ,
 o.purch_amt * s.comission AS "Comission"
FROM customer c
Join salesman s
ON c.salesman_id = s.salesman_id
JOIN orders o
ON o.customer_id = c.customer_id
WHERE c.grade >= 200

