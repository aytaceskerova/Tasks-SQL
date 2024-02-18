create database exercise
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
insert into customer values
(3002,'Nick Rimando','New york',100,5001),
(3005,'Graham Zusi','California',200,5002),
(3001,'Brad Guran','London',400,null),
(3004,'Fabian Johns','Paris',300,5006),
(3007,'Brad Davis','New york',200,5001),
(3009,'Geoff Camero','Berlin',100,null),
(3008,'Julian Green','London',300,5002),
(3003,'Jozy Altidor','Moncow',200,5007)
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
--1
SELECT name, comission FROM salesman
--2
Select DISTINCT salesman_id FROM orders

select * from nobel_win
--3
SELECT name, comission FROM salesman WHERE city = 'Paris'

--4
SELECT * FROM customer WHERE grade = 200

--5
SELECT  order_no, order_date , purch_amt FROM orders WHERE salesman_id=5001

--6
SELECT winner FROM nobel_win WHERE year = 1971 AND subject = 'Literature';

--7
SELECT * FROM nobel_win WHERE winner LIKE 'Louis%'

--8
SELECT winner FROM nobel_win WHERE (subject = 'Physics' AND year = 1970) OR  (subject = 'Economics' AND year = 1971 )

--9
SELECT * FROM nobel_win WHERE year = 1970 AND subject NOT IN ('Physiology', 'Economics')

--10
SELECT * FROM nobel_win WHERE subject NOT LIKE 'P%' 
ORDER BY year DESC, winner