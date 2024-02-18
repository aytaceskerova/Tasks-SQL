

--Advanced Level
--1 Select customer name together with each order the customer madeSelect customer name together with each order the customer made
SELECT * FROM orders
SELECT * from customers
SELECT * FROM orders
SELECT * FROM employees
SELECT 
		c.CustomerName,
		o.OrderID
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
--2 Select order id together with name of employee who handled the order
SELECT 
		o.OrderId,
		e.FirstName,
		e.LastName
FROM orders o
JOIN employees e
ON o.EmployeeID = e.EmployeeID
--3 Select customers who did not placed any order yet
SELECT 
		c.CustomerName
FROM customers c
LEFT JOIN orders o
ON  o.CustomerID = c.CustomerID
WHERE o.OrderID IS NULL
--4 Select order id together with the name of products
SELECT 
		o.OrderID,
		p.ProductName
FROM orders o
JOIN order_details 
ON o. OrderID = order_details.OrderID
JOIN products p
ON  order_details.ProductID = p.ProductID
--5 Select products that no one bought
SELECT 
		p.ProductName
FROM products p
LEFT JOIN order_details o
ON p.ProductID = o.ProductID
WHERE o.OrderID IS NULL
--6 Select customer together with the products that he bought
SELECT
		c.CustomerName,
		p.ProductName
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
JOIN order_details OrderDetails
ON o.OrderID = OrderDetails.OrderID
JOIN products p
ON OrderDetails.ProductID = p.ProductID
--7  Select product names together with the name of corresponding category
SELECT 
		p.ProductName,
		c.CategoryName
FROM products p
JOIN categories c
ON p.CategoryID = c.CategoryID
--8 Select orders together with the name of the shipping company
SELECT 
		o.OrderId,
		s.ShipperName
FROM orders o
JOIN shippers s
ON s.ShipperID = o.ShipperID
--9 Select customers with id greater than 50 together with each order they made
SELECT 
		c.CustomerID,
		c.CustomerName,
		o.OrderID
FROM customers c
JOIN orders o
ON c.CustomerID = o.CustomerID
WHERE c.CustomerID >50
--10 Select employees together with orders with order id greater than 10400
SELECT
		e.EmployeeID,
		e.FirstName,
		e.LastName,
		o.OrderID
FROM orders o
JOIN employees e
ON e.EmployeeID = o.EmployeeID
WHERE o.OrderId > 10400

-- Expert Level 

--1 Select the most expensive product
--NO 1
SELECT * FROM products
WHERE ProductID IN (
   SELECT ProductID FROM products
   WHERE Price IN (
      SELECT MAX(price) FROM  products
   )
)
--NO2
SELECT  * FROM products
WHERE Price =(SELECT MAX(Price) FROM products)
ORDER BY Price DESC

--2 Select the second most expensive product
SELECT TOP 1 * FROM products
WHERE price < (SELECT MAX(price) FROM products)
ORDER BY price DESC
--3 Select name and price of each product, sort the result by price in decreasing order
SELECT  ProductName, Price 
FROM products
ORDER BY Price DESC

--4 Select 5 most expensive products
--NO1
SELECT TOP 5 * FROM products
ORDER BY Price DESC
--NO2
SELECT * FROM products
ORDER BY Price DESC
OFFSET 0 ROWS
FETCH NEXT 5 ROWS ONLY

--5 Select 5 most expensive products without the most expensive (in final 4 products)
SELECT * FROM products
WHERE price < (SELECT MAX(price) FROM products)
ORDER BY Price DESC
OFFSET 1 ROWS
FETCH NEXT 4 ROWS ONLY

--6 Select name of the cheapest product (only name) without using LIMIT and OFFSET
SELECT MIN(Price) AS MinPrice FROM products
SELECT 
		p.ProductName 
FROM products p
JOIN(SELECT MIN(Price) AS MinPrice FROM products) AS Minimum
ON p.Price = Minimum.MinPrice

--7 Select name of the cheapest product (only name) using subquery
SELECT ProductName FROM Products
WHERE Price = (SELECT MIN(Price) FROM Products)

--8 Select number of employees with LastName that starts with 'D'
SELECT COUNT(*) AS CountOfEmployees
FROM employees
WHERE LastName LIKE 'D%';

--9 Select customer name together with the number of orders made by the corresponding customer sort the result by number of orders in decreasing order
SELECT 
		c.CustomerName,
		COUNT(*) AS NumOfOrders
FROM customers c
JOIN orders 
ON c.CustomerID = orders.CustomerID
GROUP BY c.CustomerName
ORDER BY COUNT(*) DESC

--10 Add up the price of all products
SELECT SUM(PRICE) AS TotalPrice
FROM products
--11 Select orderID together with the total price of  that Order, order the result by total price of order in increasing order
SELECT 
    o.OrderID,
    SUM(od.Quantity * p.Price) AS TotalPrice
FROM Orders o
JOIN order_details od 
ON o.OrderID = od.OrderID
JOIN Products p 
ON od.ProductID = p.ProductID
GROUP BY o.OrderID
ORDER BY TotalPrice ASC
--12 Select customer who spend the most money
WITH CustomerTotalAmount AS (SELECT c.CustomerID,c.CustomerName,SUM(order_details.Quantity * products.Price) as TotalAmount
FROM  customers c
JOIN orders 
ON c.CustomerID = orders.CustomerID
JOIN order_details
ON orders.OrderID = order_details.OrderID
JOIN products 
ON order_details.ProductID = products.ProductID
GROUP BY c.CustomerID, c.CustomerName
)
SELECT CustomerName,TotalAmount
FROM  CustomerTotalAmount
WHERE TotalAmount = (SELECT MAX(TotalAmount) FROM CustomerTotalAmount)
--13 Select customer who spend the most money and lives in Canada
WITH CustomerTotalAmount AS (SELECT c.CustomerID,c.CustomerName,SUM(order_details.Quantity * products.Price) as TotalAmount,c.Country
FROM  customers c
JOIN orders 
ON c.CustomerID = orders.CustomerID
JOIN order_details
ON orders.OrderID = order_details.OrderID
JOIN products 
ON order_details.ProductID = products.ProductID
GROUP BY c.CustomerID, c.CustomerName,c.Country
)
SELECT CustomerName,TotalAmount,Country
FROM  CustomerTotalAmount
WHERE  Country ='Canada'
ORDER BY TotalAmount DESC
OFFSET 0 ROWS
FETCH NEXT 1 ROWS ONLY

--14 Select customer who spend the second most money
WITH CustomerTotalAmount AS (SELECT c.CustomerID,c.CustomerName,SUM(order_details.Quantity * products.Price) as TotalAmount
FROM  customers c
JOIN orders 
ON c.CustomerID = orders.CustomerID
JOIN order_details
ON orders.OrderID = order_details.OrderID
JOIN products 
ON order_details.ProductID = products.ProductID
GROUP BY c.CustomerID, c.CustomerName
)
SELECT CustomerName,TotalAmount
FROM  CustomerTotalAmount
WHERE TotalAmount =
(SELECT MAX(TotalAmount) FROM CustomerTotalAmount
WHERE TotalAmount <(SELECT MAX(TotalAmount) FROM CustomerTotalAmount))
--15 Select shipper together with the total price of proceed orders
WITH ShipperTotalPrice AS (
    SELECT
        s.ShipperID,
        s.ShipperName,
        SUM(order_details.Quantity * products.Price) as TotalAmount
    FROM shippers s
    JOIN orders o 
	ON o.ShipperID = s.ShipperID
    JOIN  order_details 
	ON o.OrderID = order_details.OrderID
    JOIN products 
	ON order_details.ProductID = products.ProductID
    GROUP BY  
        s.ShipperID, s.ShipperName
)
SELECT
    ShipperID,
    ShipperName,
    TotalAmount
FROM
    ShipperTotalPrice;

