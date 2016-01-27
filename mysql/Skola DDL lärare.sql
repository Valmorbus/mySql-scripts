-- Skapa databasen
CREATE DATABASE Skola;
USE Skola;

-- Skapa användare och tilldela rättigheter
CREATE USER 'jonas'@'localhost' IDENTIFIED BY 'P@ssw0rd';
GRANT ALL ON Skola.* TO 'jonas'@'localhost';

-- Skapa taballer, relationar och integritet
CREATE TABLE Klass
(
	Kod char(5) NOT NULL,
	Namn varchar(50) NOT NULL,
	Arskurs int NOT NULL,
    PRIMARY KEY(Kod)
);
CREATE INDEX ix_Namn ON Klass(Namn);

CREATE Table Elev
(
	Personnummer char(10) NOT NULL,
	Fornamn varchar(50) NOT NULL,
	Efternamn varchar(50) NOT NULL,
	Epost varchar(50) NOT NULL, 
	Telefon char(12) NOT NULL,
	Klasskod char(5) NOT NULL,
    PRIMARY KEY(Personnummer),
	FOREIGN KEY (Klasskod) REFERENCES Klass(Kod)
);
CREATE INDEX ix_Elev_Efternamn ON Elev(Efternamn);

CREATE TABLE Kurs
(
	Kod char(5) NOT NULL,
	Namn varchar(50) NOT NULL,
	Startdatum date NOT NULL,
	Poang tinyint NOT NULL,
    PRIMARY KEY (Kod)
);
CREATE INDEX ix_Kurs_Namn ON Kurs(Namn);

CREATE TABLE KlassKurs
(
	Klasskod char(5) NOT NULL,
	Kurskod char(5) NOT NULL,
	PRIMARY KEY (Klasskod, Kurskod),
	FOREIGN KEY (Klasskod) REFERENCES Klass(Kod) ON DELETE CASCADE,
	FOREIGN KEY (Kurskod) REFERENCES Kurs(Kod) ON DELETE CASCADE
);

CREATE TABLE KursBetyg
(
	Personnummer char(10) NOT NULL,
	Kurskod char(5) NOT NULL,
	Betyg char(2),
	PRIMARY KEY (Personnummer, Kurskod),
	FOREIGN KEY (Personnummer) REFERENCES Elev(Personnummer),
	FOREIGN KEY (Kurskod) REFERENCES Kurs(Kod)
);

CREATE TABLE Lokal
(
	Lokalnummer int NOT NULL AUTO_INCREMENT,
	Namn varchar(50) NOT NULL,
	AntalPlatser tinyint NOT NULL,
    PRIMARY KEY(Lokalnummer)
);
CREATE INDEX ix_Lokal_Namn ON Lokal(Namn);

CREATE TABLE KursLokal
(
	Kurskod char(5) NOT NULL,
	Lokalnummer int NOT NULL,
	Datum date NOT NULL,
	Tid time NOT NULL,
	PRIMARY KEY (Kurskod, Lokalnummer, Datum, Tid),
	FOREIGN KEY (Kurskod) REFERENCES Kurs(Kod) ON DELETE CASCADE,
	FOREIGN KEY (Lokalnummer) REFERENCES Lokal(Lokalnummer) ON DELETE CASCADE
);

CREATE TABLE Avdelning
(
	Avdelningsnummer int NOT NULL AUTO_INCREMENT,
	Namn varchar(50) NOT NULL,
	PRIMARY KEY (Avdelningsnummer)
);
CREATE INDEX ix_Avdelning_Namn ON Avdelning(Namn);

CREATE TABLE Larare
(
	Anstallningsnummer int NOT NULL AUTO_INCREMENT,
	Fornamn varchar(50) NOT NULL,
	Efternamn varchar(50) NOT NULL,
	Epost varchar(50) NOT NULL,
	Telefon char(12) NOT NULL,
	Avdelningsnummer int,
    PRIMARY KEY (Anstallningsnummer),
	FOREIGN KEY (Avdelningsnummer) REFERENCES Avdelning(Avdelningsnummer)
);
CREATE INDEX ix_Larare_Efternamn ON Larare(Efternamn);

CREATE TABLE Undervisar
(
	Kurskod char(5) NOT NULL,
	Anstallningsnummer int,
	PRIMARY KEY (Kurskod, Anstallningsnummer),
	FOREIGN KEY (Kurskod) REFERENCES Kurs(Kod) ON DELETE CASCADE,
	FOREIGN KEY (Anstallningsnummer) REFERENCES Larare(Anstallningsnummer) ON DELETE CASCADE
);