--1.
SELECT DISTINCT e.City
FROM dbo.Employees AS e
INNER JOIN dbo.Customers AS c
ON e.City = c.City
ORDER BY e.City;

--2a.
SELECT DISTINCT c.City
FROM dbo.Customers AS c
WHERE c.City NOT IN (SELECT DISTINCT e.City FROM dbo.Employees AS e)
ORDER BY c.City;

--2b.
SELECT DISTINCT c.City
FROM dbo.Customers AS c
LEFT JOIN dbo.Employees AS e
ON c.City = e.City
WHERE e.City IS NULL
ORDER BY c.City;

--3.
SELECT p.ProductName, SUM(od.Quantity) AS TotalOrderQuantity
FROM dbo.Products AS p
INNER JOIN dbo.[Order Details] AS od
ON p.ProductID = od.ProductID
GROUP BY p.ProductName
ORDER BY TotalOrderQuantity DESC;

--4.
SELECT c.City, SUM(od.Quantity) AS TotalProductsOrdered
FROM dbo.Customers AS c
INNER JOIN dbo.Orders AS o ON c.CustomerID = o.CustomerID
INNER JOIN dbo.[Order Details] AS od ON o.OrderID = od.OrderID
GROUP BY c.City
ORDER BY TotalProductsOrdered DESC;

--5a.
SELECT City
FROM dbo.Customers
GROUP BY City
HAVING COUNT(CustomerID) >= 2 UNION
SELECT City FROM dbo.Customers
WHERE City IN (
    SELECT City
    FROM dbo.Customers
    GROUP BY City
    HAVING COUNT(CustomerID) >= 2
)
ORDER BY City;


--5b.
SELECT City
FROM dbo.Customers
WHERE City IN (
    SELECT City
    FROM dbo.Customers
    GROUP BY City
    HAVING COUNT(CustomerID) >= 2
)
ORDER BY City;

--6.
SELECT City
FROM dbo.Customers AS c
WHERE City IN (
    SELECT c.City
    FROM dbo.Customers AS c
    INNER JOIN dbo.Orders AS o ON c.CustomerID = o.CustomerID
    INNER JOIN dbo.[Order Details] AS od ON o.OrderID = od.OrderID
    GROUP BY c.City
    HAVING COUNT(DISTINCT od.ProductID) >= 2
)
ORDER BY City;

--7.
SELECT DISTINCT c.CustomerID, c.CompanyName, c.City AS CustomerCity, o.ShipCity
FROM dbo.Customers AS c
INNER JOIN dbo.Orders AS o ON c.CustomerID = o.CustomerID
WHERE c.City <> o.ShipCity
ORDER BY c.CustomerID;

--8.
WITH ProductPopularity AS (
    SELECT 
        od.ProductID, 
        SUM(od.Quantity) AS TotalQuantity,
        AVG(p.UnitPrice) AS AveragePrice
    FROM dbo.[Order Details] AS od
    INNER JOIN dbo.Products AS p ON od.ProductID = p.ProductID
    GROUP BY od.ProductID
),
TopProducts AS (
    SELECT TOP 5
        pp.ProductID,
        pp.TotalQuantity,
        pp.AveragePrice
    FROM ProductPopularity AS pp
    ORDER BY pp.TotalQuantity DESC
),
ProductCities AS (
    SELECT 
        od.ProductID, 
        c.City, 
        SUM(od.Quantity) AS CityQuantity
    FROM dbo.[Order Details] AS od
    INNER JOIN dbo.Orders AS o ON od.OrderID = o.OrderID
    INNER JOIN dbo.Customers AS c ON o.CustomerID = c.CustomerID
    GROUP BY od.ProductID, c.City
),
MostPopularCity AS (
    SELECT 
        pc.ProductID, 
        pc.City,
        pc.CityQuantity,
        RANK() OVER (PARTITION BY pc.ProductID ORDER BY pc.CityQuantity DESC) AS Rank
    FROM ProductCities AS pc
)
SELECT 
    tp.ProductID,
    tp.AveragePrice,
    mpc.City AS MostPopularCity
FROM TopProducts AS tp
INNER JOIN MostPopularCity AS mpc ON tp.ProductID = mpc.ProductID
WHERE mpc.Rank = 1
ORDER BY tp.TotalQuantity DESC;

--9a.
SELECT DISTINCT e.City
FROM dbo.Employees AS e
WHERE e.City NOT IN (
    SELECT DISTINCT o.ShipCity
    FROM dbo.Orders AS o
)
ORDER BY e.City;

--9b.
SELECT DISTINCT e.City
FROM dbo.Employees AS e
LEFT JOIN dbo.Orders AS o ON e.City = o.ShipCity
WHERE o.ShipCity IS NULL
ORDER BY e.City;

--10.

--11.
--Identitfy the duplicates and use row_number() with a CTE to give them each a unique row number 
--Use the CTE to delete the rows that have a number greater than 1