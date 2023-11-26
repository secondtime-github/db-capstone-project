CREATE DEFINER=`admin`@`localhost` PROCEDURE `AddBooking`(bid int, cid int, tn int, bd datetime)
BEGIN
	INSERT INTO Bookings 
	(BookingID, TableNumber, BookingDate, CustomerID) 
	VALUES 
	(bid, tn, bd, cid);
    select "New booking added" as Confirmation;
END