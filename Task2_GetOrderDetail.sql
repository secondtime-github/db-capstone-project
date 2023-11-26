prepare GetOrderDetail from "select OrderID, Quantity, Cost from Orders where customerID = ?";

SET @id = 1;
EXECUTE GetOrderDetail USING @id;