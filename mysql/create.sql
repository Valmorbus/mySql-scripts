-- Skapar databas
CREATE DATABASE Boende;

-- skapar användare
CREATE USER 'Simon'@'localhost' IDENTIFIED BY 'abc123';

-- ger rättigheter till användare
GRANT ALL ON Boende.* TO 'Simon'@'localhost';

-- GRANT SELECT, DELETE ON Boende.* TO 'kalle@localhost'; 
CREATE TABLE Hus
(
Nummer int NOT NULL AUTO_INCREMENT, 
Adress varchar (30) NOT NULL, 
Postnummer char(5) NOT NULL,
Ort varchar(50) NOT NULL,
PRIMARY KEY (Nummer)
); 

-- Raderar databas
-- DROP DATABASE Boende;
	