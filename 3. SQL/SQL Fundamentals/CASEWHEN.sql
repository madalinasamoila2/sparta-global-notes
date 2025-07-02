-- SELECT
-- 	CASE WHEN UnitPrice FROM Products

-- CASE WHEN
SELECT 
	TIMESTAMPDIFF(YEAR, HireDate, NOW()) AS 'Age',
	CASE 
		WHEN TIMESTAMPDIFF(YEAR, HireDate, NOW()) > 65 THEN 'Retired'
		WHEN TIMESTAMPDIFF(YEAR, HireDate, NOW()) = 60 THEN 'Retirement due'
		WHEN TIMESTAMPDIFF(YEAR, HireDate, NOW()) < 60 THEN 'More than 5 years to go'
	ELSE 'Between 60 and 65'
END AS 'Retirement Status'
FROM Employees;

SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;

-- GROUP BY HAVING --
SELECT 
	SupplierID, 
	SUM(UnitsOnOrder) AS 'Total On Order',
    AVG(UnitsOnOrder) AS 'Avg On Order'
FROM Products
GROUP BY 
	SupplierID
HAVING AVG(UnitsOnOrder) > 5


