-- Q8. SELECT CONCAT
SELECT CONCAT(FirstName,' ', LastName) AS EmployeeName FROM Employees

-- Q9. SELECT to list the six countries that have Region Codes in the Customers Table
SELECT DISTINCT country,region FROM Customers
WHERE Region IS NOT NULL


-- ARITHMETICS OPERATOR PRACTICE
SELECT SUM(UnitPrice)%COUNT(ProductID) AS AverageUnitPrice FROM `Order Details`
SELECT 28%5
SELECT AVG(UnitPrice) FROM `Order Details`

-- Q10. NEW NET TOTAL COLUMN
SELECT UnitPrice, 
Quantity, 
Discount, 
UnitPrice * Quantity AS `Gross Total`,
(UnitPrice * Quantity) * (1-Discount) AS `Net Total`
FROM `Order Details`;

SELECT * FROM `Order Details`

-- ALTER TABLE WITH NET TOTAL
ALTER TABLE `Order Details`
ADD `Net Total` DECIMAL(10,2)

-- UPDATE `Order Details` 
-- SET `Net Total` = UnitPrice * Quantity * (1-Discount) 
-- WHERE Discount > 0 AND Quantity < 5 AND OrderID IS NOT NULL

UPDATE `Order Details`  
SET `Net Total` = UnitPrice * Quantity * (1 - Discount)  
WHERE Discount > 0 
  AND Quantity < 5 
  AND OrderID IS NOT NULL 
  AND OrderID < 10000;

SELECT * FROM `Order Details`
-- Q11. ORDER BY
SELECT UnitPrice, 
Quantity, 
Discount, 
UnitPrice * Quantity AS `Gross Total`,
(UnitPrice * Quantity) * (1-Discount) AS `Net Total`
FROM `Order Details`
ORDER BY `Net Total` DESC
LIMIT 2

-- CHARINDEX
SELECT * FROM Products
WHERE LOCATE("'",ProductName) > 0;

-- In the SELECT statements
SELECT LOCATE("'",ProductName) FROM Products

-- DATE FU|NCTIONS -- 
-- GETDATE()-- For 
SELECT NOW(OrderDate) FROM Orders
-- Age
SELECT CONCAT(FirstName,' ', LastName) AS EmployeeName, 
YEAR(NOW())-YEAR(BirthDate) as Age
FROM Employees


-- GROUP BY
SELECT ROUND(AVG(ReorderLevel),2) AS AverageReorderLevel,CategoryID FROM Products
WHERE ReorderLevel != 0
GROUP BY CategoryID

SELECT ROUND(AVG(ReorderLevel),2) AS AverageReorderLevel,CategoryID FROM Products
WHERE ReorderLevel != 0
GROUP BY CategoryID
ORDER BY AverageReorderLevel DESC
LIMIT 1



