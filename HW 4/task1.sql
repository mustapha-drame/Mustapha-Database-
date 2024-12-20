DROP DATABASE IF EXISTS pet_database;
CREATE DATABASE pet_database;
USE pet_database;

DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (petName VARCHAR(20) PRIMARY KEY, owner VARCHAR(45), species VARCHAR(15), 
gender CHAR(1) CHECK (gender IN ('M', 'F')), birth DATE NOT NULL, death DATE);

CREATE TABLE petEvent (petName VARCHAR(20), eventDate DATE, eventType VARCHAR(15), remark VARCHAR(255),
PRIMARY KEY (petName, eventDate), FOREIGN KEY (petName) REFERENCES petPet (petName));
