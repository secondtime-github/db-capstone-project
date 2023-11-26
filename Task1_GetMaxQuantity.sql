CREATE DEFINER=`admin`@`localhost` PROCEDURE `GetMaxQuantity`()
BEGIN
select quantity as "Max Quantity in Order"
	from Orders
	order by quantity desc
	limit 1;
END