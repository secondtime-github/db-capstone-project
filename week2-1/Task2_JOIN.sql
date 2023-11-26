select c.customerID, c.fullname,
o.orderID, o.cost,
m.menuName,
mi.courseName, mi.startername
from Customers as c
inner join Orders as o on o.customerID = c.customerID
inner join Menus as m on m.menuID = o.menuID
inner join MenuItems as mi on mi.itemID = m.itemID
where cost > 150;