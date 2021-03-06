-- Part 2: Define the Database 
DROP DATABASE HotelData;
CREATE DATABASE IF NOT EXISTS HotelData; 
USE HotelData;

CREATE TABLE Guest (
GuestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
FirstName VARCHAR(50) NOT NULL,
LastName VARCHAR(50) NOT NULL, 
Address  VARCHAR(100) NOT NULL,
City VARCHAR(50) NOT NULL,
State VARCHAR(2) NOT NULL,
Zip VARCHAR(5) NOT NULL,
Phone VARCHAR(15) NOT NULL
);

CREATE TABLE Reservation (
ReservationId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
GuestId INT NOT NULL, 
RoomTypeId INT NOT NULL,
Adults INT NOT NULL,
Children INT NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
RoomPriceId INT NOT NULL,
RoomNumberId INT NOT NULL
);

CREATE TABLE RoomPrice (
RoomPriceId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
BasePrice DECIMAL(6,2)  NOT NULL,
ExtraPerson DECIMAL(5,2)  NULL,
Jacuzzi INT NOT NULL
);

CREATE TABLE Amenities (
AmenitiesId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Amenities VARCHAR(100) NOT NULL
);

CREATE TABLE RoomNumber (
RoomNumberId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RoomNumber INT NOT NULL, 
AmenitiesId INT NOT NULL,
ADA BOOL NOT NULL
);

CREATE TABLE RoomType (
RoomTypeId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RoomType CHAR(6) NOT NULL,
StandardOccupancy INT NOT NULL,
MaximumOccupancy INT NOT NULL
);

ALTER TABLE Reservation -- Alter the table that has an element that leads to a primary key
 ADD CONSTRAINT `fk_GuesId` FOREIGN KEY (`GuestId`) REFERENCES `Guest`
(`GuestId`) ON DELETE NO ACTION;

ALTER TABLE Reservation
 ADD CONSTRAINT `fk_RoomTypeId` FOREIGN KEY (`RoomTypeId`) REFERENCES `RoomType`
(`RoomTypeId`) ON DELETE NO ACTION;

ALTER TABLE Reservation
 ADD CONSTRAINT `fk_RoomPriceId` FOREIGN KEY (`RoomPriceId`) REFERENCES `RoomPrice`
(`RoomPriceId`) ON DELETE NO ACTION;

ALTER TABLE Reservation
 ADD CONSTRAINT `fk_RoomNumberId` FOREIGN KEY (`RoomNumberId`) REFERENCES `RoomNumber`
(`RoomNumberId`) ON DELETE NO ACTION;

ALTER TABLE RoomNumber
 ADD CONSTRAINT `fk_AmenitiesId` FOREIGN KEY (`AmenitiesId`) REFERENCES `Amenities`
(`AmenitiesId`) ON DELETE NO ACTION;

