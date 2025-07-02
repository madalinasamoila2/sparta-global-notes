-- SELECT * FROM Employees

DROP PROCEDURE IF EXISTS GetEmployeesByCity;

DELIMITER $$

CREATE PROCEDURE GetEmployeesByCity(IN city_name VARCHAR(50))
BEGIN 
	SELECT FirstName, LastName, Title, City
	FROM Employees
	WHERE City = city_name;
END$$

DELIMITER ;

CALL GetEmployeesByCity('London');