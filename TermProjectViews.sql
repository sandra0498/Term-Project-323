
use cecs323sec01bg08

-- For each menu item, give it’s spiciness,
--  and all of the different costs for that item.
--  If a given item is not on a particular menu,
--  then report “N/A” for that particular item for that particular menu.
--  Also, if an item only appears as a single serving portion,
--  put in “N/A” into the report for the gallon, … prices.
create view MenuItem_v as 
select m.foodItemName, m.price, f.spicinessLevel 
from MENUITEMS m 
inner join FOODITEMS f on m.foodItemName = f.foodItemName; 


--This one runs 
create view Customer_addresses_v as 
select cust.customerID, cust.customerFirstName, cust.customerLastName,
if( MA.accountNumber = CA.accountNumber, 'Corporate', 'Personal') as typeOfAccount
from CUSTOMER cust
inner join MIMINGSACCOUNT MA on MA.customerID = cust.customerID
inner join CORPORATIONACCOUNT CA on MA.accountNumber = CA.accountNumber
inner join PERSONALACCOUNT PA on MA.accountNumber = PA.accountNumber ;




create view Sous_mentor_v as 
select  sousChefID as "mentee", 
sousChefMentorID as  "Mentor", 
foodItemName as "skillPassed",
startDate as "StartDate"
from SOUSCHEFMENTORSHIP
natural join SOUSCHEFSPECIALTY;




create view Customer_Sales_v as 
select customerID, sum(originalAmount * quantity) as amountSpent
from customers 
natural join KNOWNCUSTOMER
natural join PAYMENT 
natural join ORDERS 
natural join ORDERITEMS;


-- List each customer and the total $ amount of their orders
--  for the past year (365 days), in order of the value of customer orders,
--  from highest to the lowest.
create view Customer_Value_v as 
select customerFirstName, customerLastName, sum(count(orderID) * quantity ) as total 
from customers 
natural join KNOWNCUSTOMER 
natural join PAYMENT 
natural join ORDERS 
natural join ORDERITEMS
having year(orderDate) = 2019
order by total desc;  



