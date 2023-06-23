---Coursera SQL basics for Data Science

--Q1 
    --Using a subquery, find the names of all the tracks for the album "Californication"
    --Answer Porcelain--

Select Tracks.Name, Albums.Title
From Tracks
Left Join Albums
On Tracks.albumID = Albums.albumID
Where Albums.Title = 'Californication'


--Q2
    --Find the total number of invoces for each customer along with the customer's full name, city and email.
    --frantisekw@jetbrains.com

Select (Customers.FirstName || Customers.LastName) As Full_Name, Customers.City, Customers.Email, Invoices.Total
From Customers
Left Join Invoices
on Customers.customerID = Invoices.customerID
Where Customers.FirstName LIKE '%Frant%'

--Q3
    --Retrieve the track name, album, artistID, and trackID for all the albums
    --Breaking The Rules

Select T.Name, A.Title, A.AlbumID, T.TrackID
From Tracks T
Left Join Albums A
ON T.AlbumID = A.AlbumID
Where T.TrackID = 12

--Q4
    --Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
    --King, Callahan

Select M.LastName As Manager, E.LastName As Employee
From Employees M
Inner join Employees E
On E.ReportsTo = M.EmployeeID

--Q5
    --Find the name and ID of the artists who do not have albums
    --Gilberto

Select a.Name, a.ArtistID, b.AlbumID
From Artists a 
Left Join Albums b 
On a.ArtistID = b.ArtistID
Where b.ArtistID IS NULL

--Q6
    --Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order
    -- Taylor

Select FirstName, LastName
From Employees
Union
Select FirstName, LastName
From Customers
Order By LastName DESC

--Q7
    --See if there are any custiners who have a different city listed in their billinng city vs their customer city
    --No customers have a different city listed in their billinng city vs customer city

Select C.FirstName, C.LastName, C.City, I.BillingCity
From Customers C
left Join Invoices I 
On C.CustomerID = I.CustomerID
Where C.City != I.BillingCity
