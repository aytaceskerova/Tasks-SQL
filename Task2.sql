create database exercise1

create table salesman (
salesman_id int primary key,
name varchar(30) not null,
city varchar(30) ,
comission float not null)
create table customer(
customer_id int primary key,
customer_name varchar(30) not null,
city varchar(30),
grade int not null,
salesman_id int )
create table orders(
order_no int primary key,
purch_amt float not null,
order_date date,
customer_id int,
salesman_id int)
ALTER TABLE customer
ADD FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);
ALTER TABLE orders
ADD FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id);
ALTER TABLE orders
ADD FOREIGN KEY (customer_id) REFERENCES customer(customer_id);
insert into salesman values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen',null,0.12),
(5007,'Paul Adam','Rome',0.13)
select * from salesman
insert into customer values
(3002,'Nick Rimando','New york',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guran','London',400,null),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New york',200,5001),
(3009,'Geoff Camero','Berlin',100,null),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moncow',200,5007)
select * from customer
insert into orders values
(70001,150.5,'2016-10-05',3005,5002),
(70009,270.65,'2016-09-10',3001,null),
(70002,65.26,'2016-10-05',3002,5001),
(70004,110.5,'2016-08-17',3009,null),
(70007,948.5,'2016-09-10',3005,5002),
(70005,2400.6,'2016-07-27',3007,5001),
(70008,5760,'2016-09-10',3002,5001),
(70010,1983.43,'2016-10-10',3004,5006),
(70003,2480.4,'2016-10-10',3009,null),
(70012,250.45,'2016-06-27',3008,5002),
(70011,75.29,'2016-08-17',3003,5007)
select * from orders
create table nobel_win (
year int not null,
subject varchar(30) not null,
winner varchar(30) not null,
country varchar(30) not null,
category varchar(30) not null)
insert into nobel_win values
(1970,'Physics','Hannes Alfven','Sweden','Scientist'),
(1970,'Physics','Louis Neel','France','Scientist'),
(1970,'Chemistry','Luis Federico Leloir','France ','Scientist'),
(1970,'Physiology','Ulf von Euler','Sweden','Scientist'),
(1970,'Physiology','Bernard Katz','Germany','Scientist'),
(1970,'Literature','Aleksandr Solzhenitsyn','Russia','Linguist'),
(1970,'Economics','Paul Samuelson','USA','Economist'),
(1970,'Physiology','Julius Axelrod','USA ','Scientist'),
(1971,'Physics','Dennis Gabor','Hungary','Scientist'),
(1971,'Chemistry','Gerhard Herzberg ','Germany','Scientist'),
(1971,'Peace','Willy Brandt','Germany','Chancellor'),
(1971,'Literature','Pablo Neruda','Chile','Linguist'),
(1971,'Economics','Simon Kuznets','Russia ','Economist'),
(1978,'Peace','Anwar al-Sadat','Egypt ','President'),
(1978,'Peace','Menachem Begin','Israel','Prime Minister'),
(1987,'Chemistry','Donald J. Cram','USA ','Scientist'),
(1987,'Chemistry','Jean-Marie Lehn ','France','Scientist'),
(1987,'Physiology','Susumu Tonegawa','Japan','Scientist'),
(1994,'Economics','Reinhard Selten','Germany','Economist'),
(1994,'Peace','Yitzhak Rabin','Israel','Prime Minister'),
(1987,'Physics','Johannes Georg Bednorz','Germany','Scientist'),
(1987,'Literature','Joseph Brodsky','Russia','Linguist'),
(1987,'Economics','Robert Slow','USA','Economist'),
(1994,'Literature','Kenzaburo Oe','Japan','Linguist')
create table item_mast(
pro_id int primary key,
pro_name varchar(30) not null,
pro_price float not null,
pro_com int not null)
insert into item_mast values
(101,'Mother Board',3200.00,15),
(102,'Key Board',450.00,16),
(103,'ZIP drive',250.00,14),
(104,'Speaker',550.00,16),
(105,'Monitor',5000.00,11),
(106,'DVD drive',900.00,12),
(107,'CD drive',800.00,12),
(108,'Printer',2600.00,13),
(109,'Refill cartridge',350.00,13),
(110,'Mouse',250.00,12)
--1

SELECT pro_name,pro_price FROM item_mast
WHERE pro_price = (SELECT min(pro_price) FROM item_mast)

--2
SELECT * FROM customer
WHERE city = 'New York' OR grade > 100

--3
SELECT * FROM salesman
WHERE comission BETWEEN 0.12 AND 0.14

--4
SELECT * FROM customer
WHERE customer_name LIKE '%n'

--5
SELECT * FROM salesman
WHERE name LIKE 'N__l%';

--6
SELECT * FROM customer 
WHERE grade IS NULL;

--7
SELECT SUM(purch_amt) AS total_purchase_amount 
FROM orders

--8

--9
SELECT city , MAX(grade) as highest_grade FROM customer
GROUP BY city

--10
SELECT customer_id,MAX(purch_amt) as highest_purchase 
From orders
GROUP BY customer_id

--11
SELECT customer_id, order_date, MAX(purch_amt) as highest_purchase 
FROM orders
GROUP BY customer_id,order_date

--12
SELECT salesman_id,MAX(purch_amt) as highest_purchase 
FROM orders
WHERE order_date='2016-08-17'
GROUP BY salesman_id
--13
SELECT customer_id,order_date ,MAX(purch_amt) as highest_purchase 
FROM orders
GROUP BY customer_id , order_date
HAVING( MAX(purch_amt) >2000)
 
 --14
 SELECT COUNT(*) as order_count
 FROM orders
 WHERE order_date = '2016-09-10'
