Use sql_assignment_1
/* 1. Desgining the  database with following table by applying Primary key and Foreign key */

--Creation of Customer table 
Create table Customer(
Id Int Primary key,
FirstName nvarchar(40),
LastName nvarchar(40),
City nvarchar(40),
Country nvarchar(40),
Phone nvarchar(20),
);

-- Creation of index for customer  table 
Create index IndexCustomerName on Customer(FirstName);

--Creation of Orders table 
Create table Orders(
Id Int Primary key,
OrderDate datetime,
OrderNumber nvarchar(10),
CustomerId int foreign key references [Customer](Id),
TotalAmount decimal(12,2)
);

-- Creation of indexes for Order table 
create index IndexOrderCustomerId on Orders(CustomerId);
create index IndexOrderOrderDate on Orders(OrderDate);

-- Creation of Product table with id as Primary Key 
Create table Product(
Id Int Primary key,
ProductName nvarchar(50),
UnitPrice decimal(12,2),
Package nvarchar(30),
IsDiscontinued bit );

-- Creation of indexes for Product table
create index IndexProductSupplierId on Product(Id);
create index IndexProductName on Product(ProductName);

-- Creation of OrderItem table 
Create table OrderItem(
Id Int Primary key,
OrderId int foreign key references Orders(Id),
ProductId int foreign key references Product(Id),
UnitPrice decimal(12,2),
Quntity int); 

-- Creation of  indexes for OrderItem table
create index IndexOrderItemOrderId on OrderItem(OrderId) ;
create index IndexOrderItemProductId on OrderItem(ProductId) ;

--Inserting values into the Customer table.
INSERT INTO  Customer 
VALUES
(1,'Nisha','Kumar','Bangalore','India','6589210450'),
(2,'Naina','paul','Bexley','London','8232122349'),
(3,'Sujith','Williams','Texas','USA','030-0074321'),
(4,'Surjeeth','Singh','Berlin','Germany','8695521124'),
(5,'Farhan','Akitham','Hyderabad','India','9021221244');

--Inserting records in Orders table
INSERT into Orders
values
(1,'2022/04/06 15:45','5464',1,4500.75),
(2,'2022/04/06 13:45','5023',3,4000.50),
(3,'2022/04/06 09:45','5784',2,3500.00),
(4,'2022/04/06 10:45','5469',4,5500.75),
(5,'2022/04/06 20:45','7856',5,4500.60);

--Insering records in OrderItem table
InSERT into OrderItem
values
(1,1,3,1500,45),
(2,3,4,3000,35),
(3,2,6,2500,30),
(4,4,2,5500.75,40),
(5,5,1,4500.60,50);

--Inserting records in Product table
Insert into Product
values
(1,'SEAFOOD',100.00,'EXOTIC LIQIDS',0),
(2,'Chai',100.00,'Chai',0),
(3,'SEAFOOD',100.00,'ABC',0);

/*3.
In Customer table FirstName Attribute should not accept null value*/
ALTER TABLE dbo.Customer
Alter Column FirstName nvarchar(40) Not NULL;

/*4.
In Order table OrderDate should not accept null value*/
ALTER TABLE Orders
Alter Column OrderDate DateTime Not NULL;

/*5.Display all customer details*/
select * from customer

/*6.write a query to display Country whose name starts with A or I */
select Country 
from customer 
where Country like 'A%' or country like 'I%';

/*7 .write a query to display whose name of customer whose third character is I */
SELECT Customer.FirstName,Customer.LastName
FROM dbo.Customer 
WHERE LastName LIKE '__I%';