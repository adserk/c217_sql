
CREATE DATABASE IF NOT EXISTS MovieCatalogue;

USE MovieCatalogue; 

CREATE TABLE IF NOT EXISTS `Movie` (
	`MovieID` int not null auto_increment,
	`GenreID` int not null,
	`DirectorID` int null,
	`RatingID` int null,
	`Title` varchar(128) not null,
	`ReleaseDate` date null,
    PRIMARY KEY (`MovieID`)
);

CREATE TABLE IF NOT EXISTS `Genre` (
`GenreID` INT AUTO_INCREMENT NOT NULL,
`GenreName` VARCHAR(30) NOT NULL,
PRIMARY KEY(`GenreID`)
);

CREATE TABLE IF NOT EXISTS `Director` (
`DirectorID` INT AUTO_INCREMENT NOT NULL,
`FirstName` VARCHAR(30) NOT NULL,
`LastName` VARCHAR(30) NOT NULL,
`BirthDate` DATE NULL,
PRIMARY KEY(`DirectorID`)
);

CREATE TABLE IF NOT EXISTS `Rating` (
`RatingID` INT AUTO_INCREMENT NOT NULL,
`RatingName` CHAR(5) NOT NULL,
 PRIMARY KEY(`RatingID`)
);

CREATE TABLE IF NOT EXISTS `Actor` (
`ActorID` INT  AUTO_INCREMENT NOT NULL,
`FirstName` VARCHAR(30) NOT NULL,
`LastName` VARCHAR(30) NOT NULL,
`BirthDate` DATE NULL,
PRIMARY KEY(`ActorID`)
);

CREATE TABLE IF NOT EXISTS `CastMember` (
`CastMemberID` INT AUTO_INCREMENT NOT NULL,
`ActorID` INT NOT NULL,
`MovieID` INT NOT NULL,
`Role` VARCHAR(50) NOT NULL,
PRIMARY KEY(`CastMemberID`)
);


ALTER TABLE `Movie`
 ADD CONSTRAINT `fk_MovieGenre` FOREIGN KEY (`GenreID`) REFERENCES `Genre`
(`GenreID`) ON DELETE NO ACTION;
ALTER TABLE `Movie`
 ADD CONSTRAINT `fk_MovieDirector` FOREIGN KEY (`DirectorID`) REFERENCES `Director`
(`DirectorID`) ON DELETE NO ACTION;
ALTER TABLE `Movie`
 ADD CONSTRAINT `fk_MovieRating` FOREIGN KEY (`RatingID`) REFERENCES `Rating`
(`RatingID`) ON DELETE NO ACTION;

ALTER TABLE `CastMember`
 ADD CONSTRAINT `fkCastMemberActor` FOREIGN KEY (`ActorID`) REFERENCES `Actor`
(`ActorID`) ON DELETE NO ACTION;
ALTER TABLE `CastMember`
 ADD CONSTRAINT `fkCastMemberMovie` FOREIGN KEY (`MovieID`) REFERENCES `Movie`
(`MovieID`) ON DELETE NO ACTION;
