-- INNER JOIN --
----------------

-- Using rows from Products, Group BY Supplier showing an 
-- average of units on order for each supplier
SELECT 
	S.SupplierID,
    S.CompanyName,
    AVG(P.UnitsOnOrder) AS AvgUnitsOnOrder
FROM 
	Products P
INNER JOIN 
	Suppliers S 
ON 
	P.SupplierID = S.SupplierID
GROUP BY 
	S.SupplierID,
    S.CompanyName
HAVING
	AVG(P.UnitsOnOrder) > 0
ORDER BY 
	S.SupplierID
    

-- LEFT JOIN --
---------------

-- Customers that haven't placed any orders
SELECT COUNT(*) FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID

SELECT * FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE OrderID IS NULL



-- LEFT & INNER JOIN -- 
-----------------------
-- First join gives the customers that have not placed orders
-- Second join, joins on employees so you will just get the same number of rows
SELECT * FROM Customers C
LEFT JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE O.OrderID IS NULL



-- SUBQUERIES --
-- WHERE CLAUSE to show which customers haven't placed any orders
SELECT * FROM Customers
WHERE CustomerID NOT IN(SELECT CustomerID FROM Orders)

-- SELECT CLAUSE 
SELECT *,(SELECT AVG(UnitPrice) FROM Products)
					FROM Products
-- SUBQUERIES
SELECT * FROM Products P
INNER JOIN (SELECT CategoryID,AVG(UnitPrice) FROM Products
					GROUP BY CategoryID) SQ1
ON P.CAtegoryID = SQ1. CategoryID

-- FROM CLAUSE








-- List Orders from the orders table and JOIN to the Customers and Employees
-- table to include Customer Name(Company Name) and Employee Name (First and Last Name)

SELECT 
	O.OrderID,
    O.OrderDate,
	C.CompanyName AS CustomerName, 
    CONCAT(E.FirstName, ' ', E.LastName) as EmployeeName, 
	O.Freight 
FROM 
	Orders O
JOIN 
	Customers C ON O.CustomerID = C.CustomerID
JOIN 
	Employees E on O.EmployeeID = E.EmployeeID
ORDER BY 
	O.OrderDate DESC

-- SUBQUERY --
-- Using a Subquery in the WHERE clause, list all Orders (OrderId, ProductId, 
-- Unit Price, Quantity and Discount) from the [order Details] table where 
-- the product has been discontinued.

SELECT * FROM `Order Details`
WHERE ProductID IN (SELECT ProductID FROM Products
						WHERE Discontinued = '1')
                                     
-- The same with a join.. what are the products that are discontinued
SELECT 
	O.OrderId, 
	O.ProductID, 
    O.UnitPrice, 
    O.Quantity,
    O.Discount 
FROM 
	`Order Details` O
INNER JOIN 
	Products P ON O.ProductID = P.ProductID
WHERE 
	P.Discontinued = 1

-- Count to the same number
SELECT COUNT(*) FROM `Order Details` O
INNER JOIN Products P ON O.ProductID = P.ProductID
WHERE P.Discontinued = 1
