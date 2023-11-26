CREATE DEFINER=`admin`@`localhost` PROCEDURE `UpdateBooking`(bid int, bd datetime)
BEGIN
	UPDATE Bookings 
    SET BookingDate = bd
    WHERE BookingID = bid;
    select concat("Booking ", bid, " updated") as Confirmation;
END