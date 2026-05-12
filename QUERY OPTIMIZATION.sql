SET STATISTICS TIME ON
SELECT * FROM Sales.SalesOrderHeader
WHERE YEAR(OrderDate)=2014

SELECT * FROM Sales.SalesOrderHeader
WHERE OrderDate >= '2014-01-01'
AND OrderDate < '2015-01-01'
