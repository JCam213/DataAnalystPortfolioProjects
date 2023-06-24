--Q1
--Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. 
--Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)

Select CustomerID, (FirstName || ' ' || LastName) As FullName, UPPER(City || ' ' || Country) AS Location, Address
From Customers 

--Q2
--Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. 
--Make the new field lower case and pull each individual step to show your work.

Select FirstName, LOWER(SUBSTR(FirstName, 1, 4) || SUBSTR(LastName, 1, 2)) AS NewID
From Employees
Where FirstName = 'Robert'

--Q3
--Show a list of employees who have worked for the company for 15 or more years using the current date function. 
--Sort by lastname ascending.

Select FirstName, LastName, HireDate,
    (STRFTIME('%Y', 'now') - STRFTIME('%Y', HireDate))
        - (STRFTIME('%m - %d', 'now') < STRFTIME('%m-%d', HireDate))
        AS YearsWorked
From Employees
Where YearsWorked >= 15
Order By LastName ASC

--Q4
--Profiling the Customers table, answer the following question.
--Are there any columns with null values? Indicate any below. Select all that apply.

Select COUNT(*)
From Customers
Where [some_column] IS NULL

--Q5
--Find the cities with the most customers and rank in descending order.

Select City, COUNT(*)
From Customers
Group by City
Order by COUNT(*) DESC

--Q6
--Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order:
--firstname, lastname, and invoiceID.

Select C.FirstName, C.LastName, I.InvoiceID, (C.FirstName || C.LastName || I.InvoiceID) AS NewID
From Customers C
LEft Join Invoices I
ON C.CustomerID = I.CustomerID
Where FirstName = 'Astrid'