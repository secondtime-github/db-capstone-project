CREATE DEFINER=`admin`@`localhost` PROCEDURE `CheckBooking`(booking_date datetime, table_number int)
BEGIN
	select case
    when count(bookingID) > 0 then concat("Table ", table_number, " is already booked")
    else concat("Table ", table_number, " is not booked yet")
    end as "Booking status"
    from Bookings
    where bookingDate = booking_date and tableNumber = table_number;
END