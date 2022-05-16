-- Asg 12, chapter 5 #1

use MyGuitarShop
select count(OrderID)as OrderCount, Sum(TaxAmount) as TaxTotal
from dbo.Orders

-- Asg 12, chapter 5 #2

use MyGuitarShop
select CategoryName , Count(Products.CategoryID) as ProductCount, max(ListPrice) as MostExpensiveProduct
from Categories join Products
on Categories.CategoryID = Products.CategoryID
group by CategoryName
order by CategoryName desc

-- Asg 12, chapter 5 #3

use MyGuitarShop
select orders.CustomerID, EmailAddress, sum(ItemPrice * Quantity) as TotalItemPrice,
       sum(DiscountAmount * Quantity) as TotalDiscountAmmount
from Customers join Orders
on Customers.CustomerID = Orders.CustomerID
join OrderItems on Orders.OrderID = OrderItems.OrderID
group by orders.CustomerID, EmailAddress
order by TotalItemPrice desc

--Asg 12, chapter 5 #4

use MyGuitarShop
select customers.CustomerID, EmailAddress, count(*) as OrderCount, sum(ItemPrice) as OrderTotal
from Customers join Orders
on Customers.CustomerID = Orders.CustomerID
join OrderItems on orders.CustomerID = OrderItems.OrderID
group by Customers.CustomerID, EmailAddress
having count(*) >= 2
order by OrderTotal desc

--Asg 12, chapter 5 #5

use MyGuitarShop
select customers.CustomerID, EmailAddress, count(*) as OrderCount, sum(ItemPrice) as OrderTotal
from Customers join Orders
on Customers.CustomerID = Orders.OrderID
join OrderItems on Orders.CustomerID = OrderItems.OrderID
group by customers.CustomerID, EmailAddress
having count(*) >= 2 and sum(ItemPrice) >= 500
order by OrderTotal desc

--Asg 12, chapter 5 #6

use MyGuitarShop
select ProductName, sum((ItemPrice - DiscountAmount) * Quantity) as ProductTotal
from Products join Orders
on Products.ProductID = Orders.OrderID
join OrderItems on orders.CustomerID = OrderItems.OrderID
group by ProductName  with rollup

--Asg 12, chapter 5 #7

use MyGuitarShop
select EmailAddress, Quantity as NumberOfProducts
from Customers join OrderItems
on Customers.CustomerID = OrderItems.OrderID
group by EmailAddress, Quantity
having Quantity > 1
order by NumberOfProducts desc
use MyGuitarShop
select * from Orders
select * from OrderItems