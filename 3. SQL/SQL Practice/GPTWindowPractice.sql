-- Show top 5 products by total revenue. -- good, well done
SELECT 
    P.ProductName,
    SUM(od.UnitPrice * od.Quantity) AS TotalRevenue 
FROM 
	`order details` od
INNER JOIN 
	Products P ON od.ProductID = P.ProductID
GROUP BY 
	P.ProductName
ORDER BY
	TotalRevenue DESC
LIMIT 
	5;

-- Find the most sold product per category.
SELECT 
	C.CategoryName, 
    P.ProductName, 
    SUM(od.Quantity) AS TotalQuantity 
FROM 
	Categories C
INNER JOIN 
	Products P ON C.CategoryID = P.CategoryID
INNER JOIN 
	`order details` od ON P.ProductID = od.ProductID
GROUP BY  
	C.CategoryName, 
	P.ProductName
ORDER BY 
	SUM(Quantity) DESC

-- This is good but it gives all the number of quantities for each category
-- Adding a step to create CTE, creating RankedSales temp table
-- RANK() OVER (PARTITION BY CategoryName ORDER by TotalQuantity)
-- And then select that where rnk=1 so it chooses the highest.
WITH 
	ProductSales
AS( SELECT 
	C.CategoryName, 
    P.ProductName, 
    SUM(od.Quantity) AS TotalQuantity 
FROM 
	Categories C
INNER JOIN 
	Products P ON C.CategoryID = P.CategoryID
INNER JOIN 
	`order details` od ON P.ProductID = od.ProductID
GROUP BY  
	C.CategoryName, 
	P.ProductName
ORDER BY 
	SUM(Quantity) DESC),

RankedSales AS (SELECT 
	*,
    RANK() OVER(PARTITION BY CategoryName ORDER BY TotalQuantity) AS rnk
FROM ProductSales)

SELECT 
	CategoryName, 
	ProductName,
	TotalQuantity
FROM 
	RankedSales
WHERE rnk = 1;

-- Rank employees by their hire date within each country. 
SELECT 
	EmployeeID,
	CONCAT(FirstName,' ',LastName),
    Country,
    HireDate,
    RANK() OVER(PARTITION BY Country ORDER BY HireDate) AS RankWithinCountry
FROM 
	employees
-- ----- CORRECT ------ --


-- Show the top 3 most expensive products per category using rANK()
WITH RankedProducts AS (SELECT 
	ProductId,
    ProductName,
    UnitPrice,
    CategoryID,
    RANK() OVER(PARTITION BY CategoryID ORDER BY UnitPrice DESC) as PriceRank
FROM
	Products
)
SELECT * FROM RankedProducts
WHERE PriceRank <= 3
-- CORRECT :) --------------

-- Assign row numbers to orders per customer by order date.
SELECT 
	OrderID,
    CustomerID,
    OrderDate,
    RANK() OVER(ORDER BY OrderDate) as DateRank,
    ROW_NUMBER() OVER(ORDER BY OrderDate) as RowNumber
FROM 
	Orders
    




