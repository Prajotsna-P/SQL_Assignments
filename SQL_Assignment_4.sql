USE sql_assignment_1
GO

--Print the Total price of orders which have the products supplied by 'Exotic Liquids' if the price is > 50 and also print it by Shipping company's Name

SELECT SUM(UnitPrice) As Total,Package
FROM Product 
GROUP BY ProductName
having Package ='exotic liquids' and UnitPrice >50;

--Display the first word of all the company name

select SUBSTRING(Package,1,4) as MyFirstWord from Product;

--Display the employee details whose joined at first

SELECT * FROM Employee
group by DOJ
having count(*)=1;

--Display the employee details whose joined at recently

SELECT * FROM Employee
group by DOJ
HAVING MAX(DOJ);

--Write a query to get most expense and least expensive Product list (name and unit price).

SELECT ProductName,MAX(UnitPrice) AS MOST_EXPENSE,
MIN(UnitPrice) AS LEAST_EXPENCE
FROM Product
GROUP BY ProductName, UnitPrice
HAVING count(unitprice)>1 ;

--Display the list of products that are out of stock

SELECT  * FROM Product
WHERE OutOfStock ='yes';

--Display the list of products whose unitinstock is less than unitonorder

SELECT * FROM Product
WHERE InStock < UnitsOrder;

--Display list of categories and suppliers who supply products within those categories

SELECT ProductName,Package
FROM Product
GROUP BY ProductName,Package
HAVING count(Package)>=1 ;

--Write  query that determines the customer who has placed the maximum number of orders

SELECT * FROM Customer
where Id=
(SELECT Id FROM Orders
GROUP BY CUSTOMERID
HAVING MAX(CUSTOMERID)>0);

--Display the customerid whose name has substring ‘RA’
SELECT id FROM Customer WHere FirstName LIKE '%RA%' ;

