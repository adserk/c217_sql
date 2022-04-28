USE HotelData;
-- Need to use subtable to call RoomPrice.Jacuzzi when the room has jacuzzi
-- Need to use subtable to call RoomPrice.ExtraPerson when the room has extra person
-- Need to query The TotalRoomPrice differently for every rows 
-- since amenities & Extra Person Vs StandardOccupancy varies
SELECT 
CASE WHEN a.Amenities LIKE '%Jacuzzi' THEN '25' ELSE '0' END AS `JacuzziPrice`,
CASE WHEN r.Adults > rt.StandardOccupancy THEN 10*(r.Adults-rt.StandardOccupancy) ELSE 0 END AS `ExtraPersonPrice`,

rn.RoomNumber, 
a.Amenities, a.AmenitiesId,
-- rp.ExtraPerson, rp.Jacuzzi,
rt.StandardOccupancy,
r.Adults, r.Children, r.StartDate, 
CONCAT(g.FirstName, ' ', g.LastName) Name, 
r.EndDate, DATEDIFF(r.EndDate, r.StartDate) AS days, 
(rp.BasePrice) * DATEDIFF(r.EndDate, r.StartDate) AS TotalRoomCost

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
-- WHERE a.Amenities LIKE '%Jacuzzi' OR  
-- rt.StandardOccupancy < r.Adults
ORDER BY StartDate;