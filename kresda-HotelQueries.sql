-- Part 4: Query the Database
-- 1. Write a query that returns a list of reservations 
-- that end in July 2023, including the name of the guest, the room number(s), and the reservation dates.

USE HotelData;
SELECT 
r.ReservationId AS `Reservation ID`, 
CONCAT(g.FirstName, ' ', g.LastName) `Name`, 
rn.RoomNumber AS `Room Number(s)`, 
r.StartDate `Check-In Date`, 
r.EndDate `Check-Out Date`

FROM Guest g
JOIN Reservation r
	ON g.GuestId = r.GuestId
JOIN RoomNumber rn
	ON r.RoomNumberId = rn.RoomNumberId
WHERE r.EndDate < '2023-07-31'


-- 2. Write a query that returns a list of all 
-- reservations for rooms with a jacuzzi, displaying the guest's name, 
-- the room number, and the dates of the reservation.
USE HotelData;
SELECT 
r.ReservationId AS `Reservation ID`, 
CONCAT(g.FirstName, ' ', g.LastName) `Name`, 
a.Amenities AS Amenities,
rn.RoomNumber AS `Room Number(s)`, 
r.StartDate `Check-In Date`, 
r.EndDate `Check-Out Date`

FROM Guest g
JOIN Reservation r
	ON g.GuestId = r.GuestId
JOIN RoomNumber rn
	ON r.RoomNumberId = rn.RoomNumberId
JOIN Amenities a
	ON rn.AmenitiesId = a.AmenitiesId
WHERE Amenities LIKE '%Jacuzzi'

-- 3. Write a query that returns all the rooms reserved for a specific guest, 
-- including the guest's name, the room(s) reserved, the starting 
-- date of the reservation, and how many people were included in the reservation. 
-- (Choose a guest's name from the existing data.)
USE HotelData;
SELECT 
r.ReservationId AS `Reservation ID`, 
CONCAT(g.FirstName, ' ', g.LastName) `Name`, 
rn.RoomNumber AS `Room Number(s)`, 
(r.Adults + r.Children) AS `Total Number of Guests`,
r.StartDate `Check-In Date`, 
r.EndDate `Check-Out Date`

FROM Guest g
JOIN Reservation r
	ON g.GuestId = r.GuestId
JOIN RoomNumber rn
	ON r.RoomNumberId = rn.RoomNumberId
JOIN Amenities a
	ON rn.AmenitiesId = a.AmenitiesId
WHERE g.FirstName = "Mack" AND g.LastName = "Simmer"
-- JOIN RoomType rt
-- 	ON r.RoomtypeId = rt.RoomTypeId 

-- 4. Write a query that returns a list of rooms, reservation ID, and per-room cost for each reservation. 
-- The results should include all rooms, whether or not there is a reservation associated with the room.
-- Need to use subtable to call RoomPrice.Jacuzzi when the room has jacuzzi
-- Need to use subtable to call RoomPrice.ExtraPerson when the room has extra person
-- Need to query The TotalRoomPrice differently for every rows 
-- since amenities & Extra Person Vs StandardOccupancy varies
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

ORDER BY StartDate;

-- 5. Write a query that returns all the rooms accommodating at least 
-- three guests and that are reserved on any date in April 2023.
USE HotelData;
SELECT 
r.ReservationId AS `Reservation ID`, 
CONCAT(g.FirstName, ' ', g.LastName) `Name`, 
rn.RoomNumber AS `Room Number(s)`, 
(r.Adults + r.Children) AS `Total Number of Guests`,
r.StartDate `Check-In Date`, 
r.EndDate `Check-Out Date`

FROM Guest g
JOIN Reservation r
	ON g.GuestId = r.GuestId
JOIN RoomNumber rn
	ON r.RoomNumberId = rn.RoomNumberId
JOIN Amenities a
	ON rn.AmenitiesId = a.AmenitiesId
WHERE (r.Adults + r.Children) >= 3 AND 
(r.StartDate BETWEEN '2023-04-01' AND '2023-04-30') 
-- In this data there's no reservation with more than 3 guests AND in April 2023

-- 6. Write a query that returns a list of all guest names and the number of reservations 
-- per guest, sorted starting with the guest with the most reservations and then by the guest's last name.
USE HotelData;
SELECT r.GuestId,
g.FirstName, g.LastName,
COUNT(r.GuestId) AS reservation_count

FROM Guest g
JOIN Reservation r
	ON g.GuestId = r.GuestId
JOIN RoomNumber rn
	ON r.RoomNumberId = rn.RoomNumberId
GROUP BY r.GuestId
ORDER BY COUNT(r.GuestId) DESC, g.LastName;

-- 7. Write a query that displays the name, address, and phone number of 
-- a guest based on their phone number. (Choose a phone number from the existing data.)
USE HotelData;
SELECT 
g.FirstName AS `First Name`, 
g.LastName AS `Last Name`, 
g.Address AS `Address`,
g.Phone AS `Phone Number`

FROM Guest g
WHERE Phone LIKE '(214) 730-0298';
