-- Task 5
Select Name AS DepartmentName from Departments

-- Task 6
Select  e.FirstName, e.LastName, e.Salary AS EmployeeSalary From Employees e

-- Task 7
Select FirstName AS Name From Employees
Union
Select LastName AS Name From Employees

-- Task 8
Select * From Addresses

-- Task 9
Select DISTINCT Salary,  FirstName From Employees

-- Task 10
Select FirstName, LastName, JobTitle From Employees
Where JobTitle = 'Sales Representative'

-- Task 11
Select FirstName From Employees
Where FirstName LIKE 'SA%'

-- Task 12
Select LastName From Employees
Where LastName Like '%ei%'

--Task 13
Select FirstName, LastName, Salary From Employees
Where Salary > 20000 AND Salary < 30000

-- Task 14
Select FirstName, Salary From Employees
Where Salary = 25000 OR Salary = 14000 OR Salary = 12500 OR Salary = 23600

-- Task 15
Select FirstName From Employees
Where ManagerID is NULL

-- Task 16
Select Salary From Employees
Where Salary >= 50000 ORDER by Salary DESC

-- Task 17
Select Salary From Employees
Order by Salary desc
offset 20 rows 
Fetch next 5 rows only

-- Task 18
Select e.FirstName, a.AddressText from Employees e
Inner join Addresses a
On e.AddressID = a.AddressID

-- Task 19
Select e.FirstName, a.AddressText 
from Employees e, Addresses a
Where e.AddressID = a.AddressID

-- Task 20
Select e.FirstName as 'Employee', m.FirstName as 'Manager' from Employees e, Employees m
Where e.ManagerID = m.EmployeeID
order by e.EmployeeID

-- Task 21
Select e.FirstName as 'Employee', m.FirstName as 'Manager', a.AddressText as 'Address' from Employees e, Employees m, Addresses a
Where e.ManagerID = m.EmployeeID AND a.AddressID = e.AddressID 
order by e.EmployeeID

-- Task 22
Select Name from Departments
UNION
Select Name from Towns

-- Task 23
Select e.FirstName as 'Employee', m.FirstName as 'Manager' from Employees e, Employees m
Where e.ManagerID = m.EmployeeID Or e.ManagerID IS NULL
order by e.EmployeeID
select * from Employees
select * from Departments

-- Task 24
Select e.FirstName, e.LastName, d.Name, e.HireDate from Employees e, Departments d
Where e.HireDate >= '1995-01-01 00:00:00' 
AND e.HireDate <= '2005-01-01 00:00:00'
AND d.Name = 'Sales'
OR d.Name = 'Finance'

select e.FirstName, e.LastName, pr.Name
From Employees e
inner join EmployeesProjects p 
On e.EmployeeID = p.EmployeeID
inner join Projects pr
On pr.ProjectID = p.ProjectID

Select Name as Game,
	(Case when DATEPART(Hour, Start) >= 0 AND DATEPART(Hour, Start) < 12 THEn 'morning'
	When DatePart(Hour, Start) >= 12 AND DATEPART(Hour, Start) < 18 Then 'afternoon'
	When DATEPART(Hour, Start) >= 18 AND DATEPART(Hour, Start) < 24 Then 'night' as [Duration])
	Case When Duration <= 3 Then 'Extra Short'
	When Duration >= 4 AND Duration <= 6 then 'Short'
	When Duration >6 Then 'Long'
	When Duration Is null Then 'Extra long' end as [Duration]

From Games