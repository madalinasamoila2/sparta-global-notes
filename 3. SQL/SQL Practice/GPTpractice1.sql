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

-- List customers who haven’t placed any orders.
		
        
