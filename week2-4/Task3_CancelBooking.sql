CREATE PROCEDURE `CancelBooking` (bid int)
BEGIN
	delete from Bookings where bookingID = bid;
    select concat("Booking ", bid, " cancelled") as Confirmation;
END
