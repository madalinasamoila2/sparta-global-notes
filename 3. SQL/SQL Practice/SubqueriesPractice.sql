-- Q1 Return the following Order ID, Customer ID, Employee ID,
-- Order Date, Time Since Customer's First Order

SELECT 
	O1.OrderID,
    O1.CustomerID,
    O1.EmployeeID,
    O1.OrderDate,
	TIMESTAMPDIFF(YEAR, O2.FirstOrderDate, O1.OrderDate) AS TimeSinceFirstCustomersOrderYears,
    TIMESTAMPDIFF(MONTH, O2.FirstOrderDate, O1.OrderDate) AS TimeSinceFirstCustomersOrderMonths,
    TIMESTAMPDIFF(DAY, O2.FirstOrderDate, O1.OrderDate) AS TimeSinceFirstCustomersOrderDays
FROM
	Orders O1
JOIN (SELECT 
	CustomerID,
    MIN(OrderDate) AS FirstOrderDate
 FROM Orders
 GROUP BY CustomerID) O2 ON O1.CustomerID = O2.CustomerID
 
 
-- try do month, day
-----------------------------------------------------
-- CUME_DIST() OVER (ORDER BY x)
-- Returns the cumulative distribution of a value in a group of values.

-- For each row, it calculates the proportion of rows less than or equal
-- to current row's value
-- Number of rows with value <= current value / total number of rows.
SELECT 
	OrderID,
    CUME_DIST() OVER (ORDER BY Freight ASC) AS CumDistRank,
    PERCENT_RANK() OVER (ORDER BY Freight ASC) AS FreightPercentRank
FROM 
	Orders
------------------------------------------------------

-- PERCENT_RANK() OVER (ORDER BY x)
-- Calculates the relative rank of a row within a group of rows
-- (rank - 1) / (total_rows - 1)
SELECT 
	OrderID,
    Freight,
    PERCENT_RANK() OVER (ORDER BY Freight ASC) AS FreightPercentRank
FROM 
	Orders
    
    
-- PERCENTILE_DISC(a) WITHIN GROUP (ORDER BY x OVER() )
-- Returns the discrete percentile value — the first value 
-- in the ordered set that is greater than or equal to the a percentile.
SELECT 
	OrderID,
    Freight,
    NILE(4) OVER (ORDER BY Freight ASC) AS FreightPercentRank
FROM 
	Orders
    
-- PERCENTILE_CONT(a
    
-- CTE
-- Using an inner join, list all product names for categories with an
-- average unit price greater than $30.

WITH AverageUnitPrice AS(
	SELECT 
		CategoryID,
		ProductName, 
		ROUND(AVG(UnitPrice),2) AS AvgPrice
	FROM Products
    GROUP BY ProductName, CategoryID)
    
SELECT A.ProductName, C.CategoryName, A.AvgPrice FROM AverageUnitPrice A
INNER JOIN Categories C ON A.CategoryID = C.CategoryID
WHERE A.AvgPrice > 30;
	
-- Local Temporary Table
-- a base table that exists only for the duration of a specific database session 
-- and is not stored permanently in the database

-- GLOBAL Temporary Table
-- visibile to all users and sessions

-- EXAMPLE
DROP TABLE IF EXISTS TempOrders;
CREATE TEMPORARY TABLE IF NOT EXISTS TempOrders AS
(
    SELECT 
        OrderID,
        OrderDate,
        RequiredDate,
        ShippedDate
    FROM 
        Orders
);

-- My Example
DROP TABLE IF EXISTS EmployeeTemp;
CREATE TEMPORARY TABLE EmployeeTemp (
    EmployeeID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2)
);
INSERT INTO 
	EmployeeTemp
		(EmployeeID,
		 FirstName,
		 LastName,
		 Salary)
SELECT 
	EmployeeID,
	FirstName,
	LastName,
	Salary
FROM 
	Employees


-- Example UPDATE Statement
UPDATE...

-- PIVOT - returns rows into columns
-- UNPIVOT - returns columns into rows


-- UNPIVOT 
-- --------------------------------------
-- Doesn't work in MySQL
SELECT CompanyName, ContactNumber, ContactType FROM Customers
UNPIVOT(ContactNumber FOR ContactType IN (Phone,Fax))

-- So we use instead UNIONS, (Phone,Fax) will get slotted in the new table
CREATE TEMPORARY TABLE
SELECT CompanyName, Phone AS ContactNumber, 'Phone' AS ContactType FROM Customers
UNION 
SELECT CompanyName, Fax AS ContactNumber, 'FAX' as ContactType FROM CUSTOMERS







