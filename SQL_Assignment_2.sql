USE sql_assignment_1
GO
--Display the details from Customer table who is from country Germany

SELECT * FROM Customer
WHERE Country= 'GERMANY';

SELECT * from Orders

UPDATE Orders
set OrderDate='20220402'
where Id =3;

CREATE TABLE Employee(
EmployeeId int IDENTITY(1,1) PRIMARY KEY,
FirstName nvarchar(40),
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(40),);



INSERT INTO dbo.Employee(FirstName,LastName,City,Country,Phone)
VALUES ('Niam','Niwas','Bangalore','INDIA','6639293390'),
('SACHIN','TENDULKAR','MUMBAI','INDIA','7639293390'),
('RAHUL','PAUL','Scotland','UK','030-0074321'),
('ZENDAYA','WILLIAMS','Berlin','GERMANY','7894561230'),
('VRINDA','VISWAS','PUNE','INDIA','846283210');

--Display the  full name of the employee  

SELECT * FROM Employee;
--Display the  customer details  who has Fax number

SELECT * FROM Customer 
WHERE FaxNumber like '[+]%'or FaxNumber like '%-%';

--display the customer details whose name holds second letter as U

SELECT * FROM Customer
WHERE LastName LIKE '%U';

--select order Details where unit price is greater than 10 and less than 20

SELECT * FROM OrderItem
WHERE UnitPrice > 10 AND UnitPrice < 20;

--Display order details which contains shipping date and arrange the order by date

SELECT OrderDate AS SHIPPING_DATE 
FROM Orders
ORDER BY OrderDate ASC;

--Print the orders shipped by ship name 'La corned'abondance' between 2 dates(Choose dates of your choice)

SELECT ShipName
FROM Orders
where ShipName =''La corned abondance' AND'OrderDate BETWEEN '2022-04-02' AND '2022-04-05' 
ORDER BY OrderDate ASC;

--Print the products supplied by 'Exotic Liquids'

SELECT * FROM Product
WHERE Package ='EXOTIC LIQUIDS';

--print the average quantity ordered for every product

SELECT AVG(QUANTITY) AS Avg_Quantity
FROM OrderItem
GROUP BY ProductId;

--Print all the Shipping company name and the ship names if they are operational

SELECT ShipCompany, ShipName
From ShippingTable
Where Operational = 'yes';

--Print all Employees with Manager Name

SELECT E.NAME AS EMPLOYEE_NAME,M.NAME AS MANAGER_NAME
FROM Employee E JOIN Employee M
ON E.MANAGER=M.MANAGER;

--Print the bill for a given order id .bill should contain Productname, Categoryname,price after discount

SELECT OI.OrderId,P.ProductName,P.Category,P.Discount
FROM Product P INNER JOIN OrderItemTable OI
ON P.ProductId=OI.ProductId;

--Print the Total price of orders which have the products supplied by 'Exotic Liquids' if the price is > 50 and also print it by Shipping company's Name

SELECT SUM(UnitPrice) As Total,ProductName 
FROM Product
GROUP BY Package
having Package ='exotic liquids' and UnitPrice >50;