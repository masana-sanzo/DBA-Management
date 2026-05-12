SET STATISTICS TIME ON


CREATE INDEX IN_ORDERQTY
ON Sales.SalesOrderDetail(OrderQty)

SELECT * FROM Sales.SalesOrderDetail
WHERE OrderQty=1