USE HotelData;
SELECT 
r.ReservationId AS `Reservation ID`,
CONCAT(g.FirstName, ' ', g.LastName) `Guest Name`, 
rn.RoomNumber AS `Room Number`, 
a.Amenities, 
r.StartDate, 
r.EndDate, 
DATEDIFF(r.EndDate, r.StartDate) AS `Days Reserved`, 
rp.BasePrice,
CASE WHEN a.Amenities LIKE '%Jacuzzi' THEN '25' ELSE '0' END AS `JacuzziPrice`,
CASE WHEN r.Adults-rt.StandardOccupancy > 0 THEN r.Adults-rt.StandardOccupancy ELSE 0 END AS `Extra Person`,
CASE WHEN r.Adults-rt.StandardOccupancy > 0 THEN 10*(r.Adults-rt.StandardOccupancy) ELSE 0 END AS `Extra Person Price`,
-- Need to use extra parenthesise to call on 'CASE WHEN' columns
(SELECT (`Extra Person Price`+`JacuzziPrice`+rp.BasePrice)*(`Days Reserved`)) AS `TotalRoomCost`
FROM Guest g
JOIN Reservation r
	ON g.GuestId = r.GuestId
JOIN RoomPrice rp
	ON r.RoomPriceId = rp.RoomPriceId
JOIN RoomNumber rn
	ON r.RoomNumberId = rn.RoomNumberId
JOIN RoomType rt
	ON r.RoomTypeId = rt.RoomTypeId
JOIN Amenities a
	ON a.AmenitiesId = rn.AmenitiesId
ORDER BY rn.RoomNumber;