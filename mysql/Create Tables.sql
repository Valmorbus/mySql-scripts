-- Vilken databas man kör
USE Boende;

-- Skapar nytt table
CREATE TABLE Hus
(
Nummer int NOT NULL AUTO_INCREMENT, 
Adress varchar (30) NOT NULL, 
Postnummer char(5) NOT NULL,
Ort varchar(50) NOT NULL,
PRIMARY KEY (Nummer)
);

CREATE TABLE Person
(Personnummer char(10), -- PRIMARY KEY,
Namn varchar (50) NOT NULL,
Epost varchar (25) NOT NULL,
Telefonnummer char (15),
PRIMARY KEY (Personnummer),
Husnummer int NOT NULL
-- FOREIGN KEY (Husnummer) REFERENCES Hus(Nummer) ON DELETE CASCADE -- Tar bort alla som bor i huset
);


CREATE TABLE HusPerson
(
Husnummer int NOT NULL,
Personnummer char(10) NOT NULL,
PRIMARY KEY (Husnummer, Personnummer),
FOREIGN KEY (Husnummer) REFERENCES Hus(Nummer) ON DELETE CASCADE, -- Tar bort alla instanser vid delete
FOREIGN KEY (Personnummer) REFERENCES Person(Personnummer) 
 );
 -- Skapar index
 CREATE INDEX Hus_Adress ON Hus(Adress);
 CREATE INDEX Person_Namn ON Person(Namn);
 
 