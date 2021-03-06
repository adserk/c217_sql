-- Part 3: Manage the Data
USE HotelData;
INSERT INTO Guest (FirstName, LastName, Address, City, State, Zip, Phone) 
VALUES 
	('Kresda', 'Rattanasudsai', '965 Surrey Street', 'Oswego', 'NY', '13126', '(834) 986-1390'),
	('Mack', 'Simmer', '379 Old Shore Street','Council Bluffs', 'IA', '51501', '(291) 553-0508'),
	('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla',	'AK', '99654', '(478) 277-9632'),
    ('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
    ('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214) 730-0298'),
    ('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
    ('Zachery', 'Luechtefeld', '7 Poplar Dr.',	'Arvada', 'CO', '80003', '(814) 485-2615'),
    ('Jeremiah', 'Pendergrass',	'70 Oakwood St.', 'Zion', 'IL',	'60099', '(279) 491-0960'),
    ('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446) 396-6785'),
    ('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
    ('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860'),
    ('Joleen', 'Tison', '87 Queen St.', 'Drexel Hill',	'PA', '19026', '(231) 893-2755');

INSERT INTO RoomType (RoomType, StandardOccupancy, MaximumOccupancy)
VALUES
('Single', '2', '2'),
('Double', '2', '4'),
('Suite', '3', '8');

INSERT INTO RoomPrice (BasePrice, ExtraPerson, Jacuzzi)
VALUES
	('149.99', '0', '25'),
	('174.99', '10', '25'),
    ('399.99', '20', '25');
    
INSERT INTO Amenities (AmenitiesId, Amenities)
VALUES 
	('1', 'Microwave'),
    ('2', 'Refrigerator'),
    ('3', 'Jacuzzi'),
    ('4', 'Oven'),
    ('5', 'Microwave, Jacuzzi'),
    ('6', 'Microwave, Refrigerator'),
    ('7', 'Microwave, Refrigerator, Jacuzzi'),
    ('8', 'Microwave, Refrigerator, Oven')
    ;
INSERT INTO RoomNumber (RoomNumber, AmenitiesID, ADA)
VALUES 
	('201', '5', '0'),
    ('202', '2', '1'),
    ('203', '5', '0'),
    ('204', '2', '1'),
    ('205', '7', '0'),
    ('206', '6', '1'),
    ('207', '7', '0'),
    ('208', '6', '1'),
    ('301', '5', '0'),
    ('302', '2', '1'),
    ('303', '5', '0'),
    ('304', '2', '1'),
    ('305', '7', '0'),
    ('306', '6', '1'),
    ('307', '7', '0'),
    ('308', '6', '1'),
    ('401', '8', '1'),
    ('402', '8', '1');
    
INSERT INTO Reservation (GuestId, RoomTypeId, Adults, Children, StartDate, EndDate, RoomPriceId, RoomNumberId)
VALUES 
('2', '1', '1', '0', '2023-02-02', '2023-02-04', '1', '16'), 
('3', '2', '2', '1', '2023-02-05', '2023-02-10', '2', '3'),
('4', '1', '2', '0', '2023-02-22', '2023-02-24','1','13'),
('5', '2', '2', '2', '2023-03-06', '2023-03-07', '2', '1'),
('1', '1', '1','1', '2023-03-17', '2023-03-20','1','15'),
('6', '2', '3', '0', '2023-03-18', '2023-03-23', '2', '10'),
('7', '2', '2', '2', '2023-03-29', '2023-03-31', '2', '2'),
('8', '2', '2','0', '2023-03-31', '2023-04-05', '2', '12'),
('9', '2', '1', '0', '2023-04-09', '2023-04-13', '2', '9'),
('10', '1', '1', '1', '2023-04-23', '2023-04-24', '1', '7'),
('11', '3', '2', '4', '2023-05-30', '2023-06-02', '3', '17'),
('12', '1', '2', '0', '2023-06-10', '2023-06-14', '1', '6'),
('12', '1', '1', '0', '2023-06-10', '2023-06-14', '1', '8'),
('6', '2', '3', '0', '2023-06-17', '2023-06-18', '2', '8'),
('1', '1', '2', '0', '2023-06-28', '2023-07-02', '1', '5'),
('9', '2', '3', '1', '2023-07-13', '2023-07-14', '2', '4'),
('10', '3', '4', '2', '2023-07-18', '2023-07-21', '3', '17'),
('3', '2', '2', '1', '2023-07-28', '2023-07-29', '2', '11'),
('3', '1', '1', '0', '2023-08-30', '2023-09-01', '1', '13' ),
('2', '1', '2', '0', '2023-09-16', '2023-09-17', '1', '8' ),
('5', '2', '2', '2', '2023-09-13', '2023-09-15', '2', '3'),
('4', '3', '2', '2', '2023-11-22', '2023-11-25', '3', '17'),
('2', '1', '2', '0', '2023-11-22', '2023-11-25', '1', '6'),
('2', '2', '2', '2', '2023-11-22', '2023-11-25', '2', '9'), 
('11', '2', '2', '0', '2023-12-24', '2023-12-28', '2', '10')
;


DELETE FROM Reservation WHERE GuestId = '8';
DELETE FROM Guest WHERE GuestId = '8';

