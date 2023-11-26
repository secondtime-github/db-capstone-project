CREATE DEFINER=`admin`@`localhost` PROCEDURE `CancelOrder`(del_orderID int)
BEGIN
	delete from Orders where orderID = del_orderID;
    select concat("Order ", del_orderID, " is cancelled") as Confirmation;
END