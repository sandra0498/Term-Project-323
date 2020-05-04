
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


create view Customer_addresses_v as 
select customerFirstName, customerLastName 
from CUSTOMER c
inner join MIMINGSACCOUNT m on m.customerID = c.customerID
inner join ACCOUNTTYPE a on m.accountTypeID = a.accountTypeID;



create view Sous_mentor_v as 
select * from SousChefMentorship 