drop view OrdersView;
create view OrdersView as
select OrderID, Quantity, Cost
from Orders
where Quantity > 2;