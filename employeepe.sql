create procedure EmployeePerfomanceHistory
@StartDate date,
@EndDate date

as
begin

select 
p.FirstName,
p.lastname,
count(salesorderid) as totalorders

from Sales.SalesOrderHeader soh
join Person.person p on p.BusinessEntityID=soh.SalesPersonID
where soh.OrderDate between @StartDate and @EndDate
group by p.FirstName,p.LastName
order by totalorders desc

end
exec EmployeePerfomanceHistory '2012-02-13','2013-03-27'