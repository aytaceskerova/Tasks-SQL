
create database exercise6
create table salesman1 (
salesman_id int primary key,
name varchar(30) not null,
city varchar(30) ,
comission float not null)
create table customer1(
customer_id int primary key,
customer_name varchar(30) not null,
city varchar(30),
grade int not null,
salesman_id int )
create table orders1(
order_no int primary key,
purch_amt float not null,
order_date date,
customer_id int,
salesman_id int)
ALTER TABLE customer1
ADD FOREIGN KEY (salesman_id) REFERENCES salesman1(salesman_id);
ALTER TABLE orders1
ADD FOREIGN KEY (salesman_id) REFERENCES salesman1(salesman_id);
ALTER TABLE orders1
ADD FOREIGN KEY (customer_id) REFERENCES customer1(customer_id);
insert into salesman1 values(5001,'James Hoog','New York',0.15),
(5002,'Nail Knite','Paris',0.13),
(5005,'Pit Alex','London',0.11),
(5006,'Mc Lyon','Paris',0.14),
(5003,'Lauson Hen',null,0.12),
(5007,'Paul Adam','Rome',0.13)
select * from salesman1
insert into customer1 values
(3002,'Nick Rimando','New york',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guran','London',400,null),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New york',200,5001),
(3009,'Geoff Camero','Berlin',100,null),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moncow',200,5007)
select * from customer1
insert into orders1 values
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
select * from orders1
create table nobel_win1 (
year int not null,
subject varchar(30) not null,
winner varchar(30) not null,
country varchar(30) not null,
category varchar(30) not null)
insert into nobel_win1 values
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
create table item_mast1(
pro_id int primary key,
pro_name varchar(30) not null,
pro_price float not null,
pro_com int not null)
insert into item_mast1 values
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
SELECT salesman_id,name,city ,
		CONCAT (comission * 100,'%') AS commission
FROM salesman1
--2
SELECT order_date, COUNT(*) as count_of_orders
FROM orders1
GROUP BY order_date
--3
SELECT *
FROM orders1
ORDER BY order_no ASC
--4
SELECT customer_name,city,grade
FROM customer1
ORDER BY customer_id
--5
select salesman_id,
order_date,
max(purch_amt) as max_purch
from orders1
GROUP BY salesman_id, order_date
ORDER BY salesman_id ASC ,order_date ASC
--6
SELECT customer_id,
COUNT(DISTINCT order_no) as distinct_purch,
max(purch_amt) as max_purch
FROM orders1
GROUP BY customer_id