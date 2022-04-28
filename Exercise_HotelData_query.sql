USE HotelData;
-- Need to use subtable to call RoomPrice.Jacuzzi when the room has jacuzzi
-- Need to use subtable to call RoomPrice.ExtraPerson when the room has extra person 
SELECT rn.RoomNumber, 
CONCAT(g.FirstName, ' ', g.LastName) Name , 
r.Adults, r.Children, r.StartDate, 
r.EndDate, DATEDIFF(r.EndDate, r.StartDate) AS days, 
(rp.BasePrice) * DATEDIFF(r.EndDate, r.StartDate) AS TotalRoomCost
FROM Guest g
INNER JOIN (
	SELECT
    rp.Jacuzzi 
    FROM RoomPrice rp
     
    ) ja ON g.GuestId = ja.GuestId
JOIN Reservation r
	ON g.GuestId = r.GuestId
JOIN RoomPrice rp
	ON r.RoomPriceId = rp.RoomPriceId
JOIN RoomNumber rn
	ON r.RoomNumberId = rn.RoomNumberId
JOIN RoomType rt
	ON r.RoomTypeId = rt.RoomTypeId
ORDER BY StartDate;