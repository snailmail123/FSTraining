-- 1. 504 products

SELECT COUNT(*) AS num_rows 
FROM Production.Product

-- 2. 

SELECT COUNT(*) AS subcategory_amount
FROM Production.Product
WHERE ProductSubcategoryID IS NOT NULL

--3.

SELECT ProductSubcategoryID, COUNT(*) AS CountedProducts
FROM Production.Product
GROUP BY ProductSubcategoryID

--4. 209 products do not have a product subcategory

SELECT ProductSubcategoryID, COUNT(*) AS CountedProducts
FROM Production.Product
WHERE ProductSubcategoryID IS NULL
GROUP BY ProductSubcategoryID

--5. 
SELECT SUM(Quantity) AS Total
FROM Production.ProductInventory

--6. 
SELECT ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY ProductID
HAVING SUM(Quantity) < 100

--7. 
SELECT Shelf, ProductID, SUM(Quantity) AS TheSum
FROM Production.ProductInventory
WHERE LocationID = 40
GROUP BY Shelf, ProductID
HAVING SUM(Quantity) < 100

--8.
SELECT ProductID, AVG(Quantity) AS AvgQuantity
FROM Production.ProductInventory
WHERE LocationID = 10
GROUP BY ProductID

--9.
SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
GROUP BY ProductID, Shelf

--10.
SELECT ProductID, Shelf, AVG(Quantity) AS TheAvg
FROM Production.ProductInventory
WHERE Shelf != 'N/A'
GROUP BY ProductID, Shelf

--11.
SELECT Color, Class, COUNT(*) AS TheCount, AVG(ListPrice)
FROM Production.Product
WHERE Color IS NOT NULL AND Class IS NOT NULL
GROUP BY Color, Class

--12.
SELECT c.Name AS Country, sp.Name AS Province 
FROM Person.CountryRegion c 
INNER JOIN Person.StateProvince sp
ON c.CountryRegionCode = sp.CountryRegionCode

--13.
SELECT c.Name AS Country, sp.Name AS Province 
FROM Person.CountryRegion c 
INNER JOIN Person.StateProvince sp
ON c.CountryRegionCode = sp.CountryRegionCode
WHERE c.Name IN ('Germany', 'Canada')

--14.
SELECT DISTINCT p.ProductID, p.ProductName
FROM dbo.Products p
INNER JOIN dbo.[Order Details] od
ON p.ProductID = od.ProductID
INNER JOIN dbo.Orders o
ON od.OrderID = o.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -27, GETDATE());

--15.
SELECT TOP 5 o.ShipPostalCode, COUNT(od.ProductID) AS ProductsSold
FROM dbo.Orders AS o
INNER JOIN dbo.[Order Details] AS od
ON o.OrderID = od.OrderID
WHERE o.ShipPostalCode IS NOT NULL
GROUP BY o.ShipPostalCode
ORDER BY ProductsSold DESC;

--16.
SELECT TOP 5 o.ShipPostalCode, COUNT(od.ProductID) AS ProductsSold
FROM dbo.Orders AS o
INNER JOIN dbo.[Order Details] AS od
ON o.OrderID = od.OrderID
WHERE o.OrderDate >= DATEADD(YEAR, -27, GETDATE())
GROUP BY o.ShipPostalCode
ORDER BY ProductsSold DESC;

--17.
SELECT c.ContactName AS CustomerName, c.City AS CityName
FROM dbo.Orders AS o
INNER JOIN dbo.[Order Details] AS od
ON o.OrderID = od.OrderID
INNER JOIN dbo.Customers AS c
ON o.CustomerID = c.CustomerID
WHERE o.OrderDate >= DATEADD(YEAR, -27, GETDATE())
GROUP BY c.ContactName, c.City

--18.
SELECT City, COUNT(CustomerID) AS NumberOfCustomers
FROM dbo.Customers
GROUP BY City
HAVING COUNT(CustomerID) > 2
ORDER BY NumberOfCustomers DESC;

--19.
SELECT c.ContactName AS CustomerName, o.OrderDate
FROM dbo.Customers AS c
INNER JOIN dbo.Orders AS o
ON c.CustomerID = o.CustomerID
WHERE o.OrderDate > '1998-01-01'
ORDER BY o.OrderDate;

--20.
SELECT c.ContactName AS CustomerName, MAX(o.OrderDate) AS MostRecentOrderDate
FROM dbo.Customers AS c
INNER JOIN dbo.Orders AS o
ON c.CustomerID = o.CustomerID
GROUP BY c.ContactName
ORDER BY MostRecentOrderDate DESC;

--21.
SELECT c.ContactName AS CustomerName, COUNT(od.ProductID) AS ProductsBought
FROM dbo.Customers AS c
INNER JOIN dbo.Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN dbo.[Order Details] AS od
ON o.OrderID = od.OrderID
GROUP BY c.ContactName
ORDER BY ProductsBought DESC;

--22.
SELECT c.CustomerID, COUNT(od.ProductID) AS ProductsBought
FROM dbo.Customers AS c
INNER JOIN dbo.Orders AS o
ON c.CustomerID = o.CustomerID
INNER JOIN dbo.[Order Details] AS od
ON o.OrderID = od.OrderID
GROUP BY c.CustomerID
HAVING COUNT(od.ProductID) > 100
ORDER BY ProductsBought DESC;

--23.
SELECT DISTINCT s.CompanyName AS [Supplier Company Name], sh.CompanyName AS [Shipping Company Name]
FROM dbo.Suppliers AS s
INNER JOIN dbo.Products AS p ON s.SupplierID = p.SupplierID
INNER JOIN dbo.[Order Details] AS od ON p.ProductID = od.ProductID
INNER JOIN dbo.Orders AS o ON od.OrderID = o.OrderID
INNER JOIN dbo.Shippers AS sh ON o.ShipVia = sh.ShipperID
ORDER BY s.CompanyName, sh.CompanyName;

--24.
SELECT o.OrderDate, p.ProductName 
FROM dbo.Orders AS o 
INNER JOIN dbo.[Order Details] AS od ON o.OrderID = od.OrderID 
INNER JOIN dbo.Products AS p ON od.ProductID = p.ProductID 
ORDER BY o.OrderDate, p.ProductName;

--25.
SELECT e1.EmployeeID AS EmployeeID1, e1.LastName AS LastName1, e1.FirstName AS FirstName1, 
       e2.EmployeeID AS EmployeeID2, e2.LastName AS LastName2, e2.FirstName AS FirstName2, 
       e1.Title 
FROM dbo.Employees AS e1 
INNER JOIN dbo.Employees AS e2 
ON e1.Title = e2.Title AND e1.EmployeeID < e2.EmployeeID 
ORDER BY e1.Title, e1.EmployeeID, e2.EmployeeID;

--26.
SELECT m.FirstName, m.LastName, COUNT(e.EmployeeID) AS NumberOfReports
FROM dbo.Employees AS m
INNER JOIN dbo.Employees AS e
ON m.EmployeeID = e.ReportsTo
GROUP BY m.EmployeeID, m.FirstName, m.LastName
HAVING COUNT(e.EmployeeID) > 2
ORDER BY NumberOfReports DESC;

--27.
SELECT City, CompanyName AS Name, ContactName, 'Customer' AS Type
FROM dbo.Customers
UNION ALL
SELECT City, CompanyName AS Name, ContactName, 'Supplier' AS Type
FROM dbo.Suppliers
ORDER BY City, Name;

