SELECT * FROM salesman
SELECT * FROM customer
SELECT * FROM orders

--1
SELECT 
		s.name,
		c.customer_name,
		s.city
FROM customer c
JOIN salesman s
ON c.city = s.city

--2
SELECT
		o.order_no, 
		o.purch_amt, 
		c.customer_name, 
		c.city
FROM orders o
JOIN customer c
ON o.customer_id = c.customer_id
JOIN salesman s
ON o.salesman_id = s.salesman_id
WHERE o.purch_amt BETWEEN 500 AND 2000
--3
SELECT 
		c.customer_name AS "Customer Name",
		c.city,
		s.name AS "Salesman",
		s.comission
FROM customer c
JOIN salesman s
ON  s.salesman_id = c.salesman_id
--4
SELECT
		c.customer_name AS "Customer Name",
		c.city,
		s.name AS "Salesman",
		s.comission*100
FROM customer c
JOIN salesman s
ON c.salesman_id = s.salesman_id
WHERE s.comission*100>12
--5
SELECT 
		c.customer_name, 		c.city,		s.name,		s.city,		s.comission*100FROM customer cJOIN salesman sON s.salesman_id = c.salesman_idWHERE s.city!=c.city AND s.comission*100>12--6SELECT		o.order_no,
		o.order_date,
		o.purch_amt,
		c.customer_name,		c.grade,		s.name,		s.comissionFROM orders oJOIN salesman sON  s.salesman_id = o.salesman_idJOIN customer cON  c.salesman_id = o.salesman_id--7SELECT *
FROM salesman s
INNER JOIN customer c
ON s.salesman_id = c.salesman_id
INNER JOIN orders o
ON o.customer_id = c.customer_id;
--8
SELECT
		c.customer_name AS "Customer Name",
		c.city AS "Customer City",
		c.grade AS "Customer Grade",
		s.name AS "Salesman Name",
		s.city AS "Salesman City"
FROM customer c
JOIN salesman s --Burda chatgpt de inner join idi niye?
ON c.salesman_id = s.salesman_id
ORDER BY c.customer_id;

--9
SELECT
		c.customer_name AS "Customer Name",
		c.city AS "Customer City",
		c.grade AS "Customer Grade",
		s.name AS "Salesman Name",
		s.city AS "Salesman City"
FROM customer c
JOIN salesman s --Burdada hemcinin inner join idi,eyni sual
ON c.salesman_id = s.salesman_id
WHERE c.grade <300
ORDER BY c.customer_id ASC
--10
SELECT
		c.customer_name AS "Customer Name", 
		c.city,
		o.order_no AS "Order Number", 
		o.order_date,
		o.purch_amt AS "Order Amount"
FROM customer c
LEFT JOIN orders o --Buradada tam anlamadim niye leftdir
ON  c.customer_id = o.customer_id
ORDER BY o.order_date