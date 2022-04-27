USE HotelData;

SELECT rn.RoomNumber, g.FirstName, r.ReservationId, r.RoomTypeId, DATEDIFF(r.EndDate, r.StartDate) AS days, (rp.BasePrice+rp.Jacuzzi) * DATEDIFF(r.EndDate, r.StartDate)
FROM Guest g
JOIN Reservation r
ON g.GuestId = r.GuestId
JOIN RoomPrice rp
ON r.RoomPriceId = rp.RoomPriceId
JOIN RoomNumber rn
ON r.RoomNumberId = rn.RoomNumberId
ORDER BY StartDate;