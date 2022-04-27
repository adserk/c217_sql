USE HotelData;
INSERT INTO Guest (FirstName, LastName, Address, City, State, Zip, Phone) 
VALUES 
	('Kresda', 'Rattanasudsai', '965 Surrey Street','Oswego', 'NY', '13126', '(834) 986-1390'),
	('Mack', 'Simmer', '379 Old Shore Street','Council Bluffs', 'IA', '51501', '(291) 553-0508'),
	('Bettyann', 'Seery', '750 Wintergreen Dr.', 'Wasilla',	'AK', '99654', '(478) 277-9632'),
    ('Duane', 'Cullison', '9662 Foxrun Lane', 'Harlingen', 'TX', '78552', '(308) 494-0198'),
    ('Karie', 'Yang', '9378 W. Augusta Ave.', 'West Deptford', 'NJ', '08096', '(214) 730-0298'),
    ('Aurore', 'Lipton', '762 Wild Rose Street', 'Saginaw', 'MI', '48601', '(377) 507-0974'),
    ('Zachery', 'Luechtefeld', '7 Poplar Dr.',	'Arvada', 'CO', '80003', '(814) 485-2615'),
    ('Jeremiah', 'Pendergrass',	'70 Oakwood St.', 'Zion', 'IL',	'60099', '(279) 491-0960'),
    ('Walter', 'Holaway', '7556 Arrowhead St.', 'Cumberland', 'RI', '02864', '(446) 396-6785'),
    ('Wilfred', 'Vise', '77 West Surrey Street', 'Oswego', 'NY', '13126', '(834) 727-1001'),
    ('Maritza', 'Tilton', '939 Linda Rd.', 'Burke', 'VA', '22015', '(446) 351-6860');

INSERT INTO RoomType (RoomType, StandardOccupancy, MaximumOccupancy)
VALUES
('Single', '2', '2'),
('Double', '2', '4'),
('Suite', '3', '8');

INSERT INTO RoomPrice (BasePrice, ExtraPerson, Jacuzzi)
VALUES
	('149.99', NULL, '25'),
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
	('201', '5', 'No'),
    ('202', '2', 'Yes'),
    ('203', '5', 'No'),
    ('204', '2', 'Yes'),
    ('205', '7', 'No'),
    ('206', '6', 'Yes'),
    ('207', '7', 'No'),
    ('208', '6', 'Yes'),
    ('301', '5', 'No'),
    ('302', '2', 'Yes'),
    ('303', '5', 'No'),
    ('304', '2', 'Yes'),
    ('305', '7', 'No'),
    ('306', '6', 'Yes'),
    ('307', '7', 'No'),
    ('308', '6', 'Yes'),
    ('401', '8', 'Yes'),
    ('402', '8', 'Yes');
    
INSERT INTO Reservation (GuestId, RoomTypeId, Adults, Children, StartDate, EndDate, RoomPriceId, RoomNumberId)
VALUES 
('2', '1', '1', '0', '2023-02-02', '2023-02-04', '1', '16'), 
('3', '2', '2', '1', '2023-02-05', '2023-02-10', '2', '3'),
('4', '1', '2', '0', '2023-02-22', '2023-02-24','1','13'),
('5', '2', '2', '2', '2023-03-06', '2023-03-07', '2', '1'),
('1', '1', '1','1', '2023-03-17', '2023-03-20','1','15')

;


