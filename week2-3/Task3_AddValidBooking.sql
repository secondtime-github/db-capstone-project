CREATE DEFINER=`admin`@`localhost` PROCEDURE `AddValidBooking`(booking_date datetime, table_number int)
BEGIN
	declare bookedNumber int;
	START TRANSACTION;
    INSERT INTO Bookings (TableNumber, BookingDate) 
	VALUES (table_number, booking_date);
    
    select count(BookingID) into bookedNumber from Bookings
    where tableNumber = table_number and bookingDate = booking_date;
    
    if bookedNumber > 1 then
		rollback;
	else
		commit;
	end if;
END