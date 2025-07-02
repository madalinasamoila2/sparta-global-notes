-- Using an inner join, write a query to show OrderId, CustomerID,EmployeeID,
-- ...EmpolyeeOrdercount, OrderDate
-- -----------------------------LESS EFFICIENT
SELECT 
	O1.OrderID, 
    O1.CustomerID, 
    O1.EmployeeID,
    O2.EmployeeOrderCount, 
    O1.OrderDate
FROM 
	Orders O1
INNER JOIN 
	(SELECT EmployeeId,
			COUNT(*) AS EmployeeOrderCount
	FROM 
		Orders O
	GROUP BY 
		EmployeeID) O2 
ON 
	O1.EmployeeID=O2.EmployeeID
    
-- NOW USING WINDOW FUNCTION 
-- calculates how many orders each employee has processed
-- it returns that count on each row corresponding to each order.
SELECT 
	OrderID, 
    EmployeeID,
    COUNT(*) OVER(PARTITION BY EmployeeID) AS 'Employee Order Count',
    OrderDate
FROM 
	Orders 
ORDER BY
	OrderID
    
-- Take example EmployeeID= 5    
SELECT 
	OrderID,
    CustomerID,
    EmployeeID
    -- COUNT(*) OVER(PARTITION BY EmployeeID) AS EmployeeOrderCount 
FROM Orders
WHERE EmployeeID = 5




-- Query the Products Table to retrieve ProductId, ProductName,CategoryName,
-- NumberofOtherProductsInTheSameCategory
SELECT 
	P.ProductID,
    P.ProductName,
    C.CategoryName,
    COUNT(*) OVER(PARTITION BY C.CategoryName) - 1 AS NumberOfOtherProductsInTheSameCategory
FROM 
	Products P
JOIN Categories C ON P.CategoryID = C.CategoryID
    

-- Query the Products Table to retrieve ProductId, ProductName,CategoryName,
-- TotalUnitsOnOrderForCategory
SELECT 
	P.ProductID,
    P.ProductName,
    C.CategoryName,
    SUM(UnitsOnOrder) OVER(PARTITION BY C.CategoryName)  AS TotalUnitsOnOrderForCategory
FROM 
	Products P
JOIN Categories C ON P.CategoryID = C.CategoryID


-- ORDER BY --
-- ----------------------------------------- --
-- Query the order table to retrieve OrderID, CustomerID,Order Date, 
-- Rank by OrderDate, per Customer, Ordered by Order Id
SELECT 
	OrderID,
    CustomerID,
    OrderDate,
    RANK() OVER(PARTITION BY CustomerID ORDER BY OrderDate) As OrderDateRank
FROM 
	Orders
ORDER BY 
	OrderID
    
-- LEAD() looks ahead a certain number of rows
SELECT 
	ProductName,
    UnitPrice,
    LEAD(ProductName,1,NULL) OVER(ORDER BY UnitPrice) AS NextProductName
FROM 
	Products


-- LAG()- retrieve the following OrderId, OrderDate, Freight, 
-- FreightforPreviousOrder
SELECT 
	OrderID,
    OrderDate,
    Freight,
    LAG(Freight,1,NULL) OVER(ORDER BY OrderDate) AS FreightforPreviousOrder
FROM
	Orders

-- LEAD()
SELECT 
	OrderID,
    OrderDate,
    Freight,
    LEAD(Freight,1,NULL) OVER(ORDER BY OrderDate) AS FreightforNextOrder
FROM
	Orders
    
-- FIRST_VALUE()
-- retrieves the highest number of units on order for each product from the same supplier
SELECT
    ProductName,
    SupplierID,
    UnitsOnOrder,
    FIRST_VALUE(UnitsOnOrder) OVER(PARTITION BY SupplierID ORDER BY UnitsOnOrder DESC)
AS
	MostUnitsOnOrderFromSupplier
FROM
    Products


-- LAST_VALUE()
-- retrieves the last Order_ID in the window
SELECT
    OrderID,
    EmployeeID,
    OrderDate,
    LAST_VALUE(OrderID) OVER(PARTITION BY EmployeeID ORDER BY OrderID DESC)
    -- Currently the last value is returned because it picks up what the current row is
    -- Instead we want it to look at everything so we do rows between unbounded 
    -- and unbounded
AS
	LastOrderForEmployee
FROM
    Orders

-- CORRECT FORM
SELECT
    OrderID,
    EmployeeID,
    LAST_VALUE(OrderID) OVER(PARTITION BY EmployeeID ORDER BY OrderID DESC
    ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)
AS
	LastOrderForEmployee
FROM
    Orders
    
-- Join total price from the order details table to the orders table then return
-- orderid, orderdate, totalprice, 5-point moving average of total price
SELECT 
	O.OrderID,
    O.OrderDate,
    (od.Unitprice*od.quantity*(1-discount)) AS TotalPrice,
    AVG(od.Unitprice*od.quantity*(1-discount))  OVER(ORDER BY O.OrderDate ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS '5-Point Moving Average)'
FROM `order details` od
JOIN Orders O ON od.OrderID = O.OrderID
ORDER BY OrderID

-- CORRECT VERSION --
SELECT 
	O.OrderId, 
    O.Orderdate, 
    od.TotalPrice,
    AVG(od.TotalPrice) OVER(ORDER BY O.OrderDate ROWS BETWEEN 2 PRECEDING AND 2 FOLLOWING) AS '5-Point Moving Average)'
FROM Orders O
JOIN (SELECT OrderID,
    SUM(Unitprice*quantity*(1-discount)) AS TotalPrice  
    FROM `order details` 
    GROUP BY OrderID) od 
ON O.OrderID = od.OrderID

