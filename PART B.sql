

create role SalesRole
create role HRRole
create role DBA_Role
 
 
 GRANT SELECT , INSERT ,UPDATE ON SCHEMA:: Sales
 to SalesRole
 DENY SELECT on SCHEMA:: HumanResources
 to SalesRole


 GRANT SELECT , INSERT ,UPDATE ON SCHEMA:: HumanResources
 to HRRole
 DENY SELECT on SCHEMA::Sales
 to HRRole

GRANT CONTROL ON DATABASE::AdventureWorks2022 to DBA_Role


CREATE LOGIN SalesUserLogin WITH PASSWORD= 'Sales123'
CREATE LOGIN HRUserLogin WITH PASSWORD= 'HR123'
CREATE LOGIN DBAUserLogin WITH PASSWORD= 'DBA123'

CREATE USER SalesUSer FOR LOGIN SalesUserLogin
CREATE USER HRUser FOR LOGIN HRUserLogin
CREATE USER DBAUser FOR LOGIN DBAUserLogin

ALTER ROLE SalesRole ADD MEMBER SalesUser
ALTER ROLE HRRole ADD MEMBER HRUser
ALTER ROLE DBA_Role ADD MEMBER DBAUser

EXECUTE AS USER = 'SalesUser'

--SHOULD WORK
select * from Sales.Customer

UPDATE Sales.Customer
SET ModifiedDate='2022-02-02'
WHERE CustomerID=1

--SHOULD FAIL
select * from HumanResources.Employee

UPDATE HumanResources.Employee
SET JobTitle='CLEANER'
WHERE BusinessEntityID=1

revert

EXECUTE AS USER = 'HRUser'

--SHOULD FAIL
select * from Sales.Customer

UPDATE Sales.Customer
SET ModifiedDate='2022-02-02'
WHERE CustomerID=1

--SHOULD WORK
select * from HumanResources.Employee

UPDATE HumanResources.Employee
SET JobTitle='CLEANER'
WHERE BusinessEntityID=1


revert

EXECUTE AS USER = 'DBAUser'

--SHOULD WORK
select * from Sales.Customer

UPDATE Sales.Customer
SET ModifiedDate='2022-02-02'
WHERE CustomerID=1

--SHOULD WORK
select * from HumanResources.Employee

UPDATE HumanResources.Employee
SET JobTitle='CLEANER'
WHERE BusinessEntityID=1

revert


