CREATE DATABASE Skola;

USE Skola;

CREATE TABLE Klass
(
Kod char(5) PRIMARY KEY, 
Namn varchar(50) NOT NULL,
Årskurs int NOT NULL 
);

CREATE INDEX Årskurs ON Klass(Årskurs);
CREATE INDEX Namn ON Klass(Namn);

CREATE TABLE Kurs 
(
Kod char(5) PRIMARY KEY,
Namn varchar(50) NOT NULL,
Startdatum DATE NOT NULL,
Poäng TINYINT NOT NULL
);

CREATE INDEX StartDatum ON Kurs(Startdatum);
CREATE INDEX Namn ON Kurs(Namn);
CREATE INDEX Poäng ON Kurs(Poäng);

CREATE TABLE KlassKurs
(
KursKod char(5) NOT NULL,
KlassKod char(5) NOT NULL,
PRIMARY KEY (KursKod, KlassKod),
FOREIGN KEY (KursKod) REFERENCES Kurs(Kod) ON DELETE CASCADE, -- Tar bort alla instanser vid delete
FOREIGN KEY (KlassKod) REFERENCES Klass(Kod) ON DELETE CASCADE
);
 

CREATE TABLE Elev
(
Personnummer CHAR(10) PRIMARY KEY,
Förnamn varchar(50) NOT NULL,
Efternamn varchar(50) NOT NULL,
Epost varchar(50) NOT NULL,
Telefon char (12),
Klasskod char (5) NOT NULL,
FOREIGN KEY (Klasskod) REFERENCES Klass(Kod)
);

CREATE INDEX Förnamn ON Elev(Förnamn);
CREATE INDEX Efternamn ON Elev(Efternamn);

CREATE TABLE KursBetyg
(
Personnummer char(10) NOT NULL,
Kurskod char(5) NOT NULL,
Betyg char(2) NOT NULL,
PRIMARY KEY (Personnummer, Kurskod), 
FOREIGN KEY (Personnummer) REFERENCES Elev(Personnummer),
FOREIGN KEY (Kurskod) REFERENCES Kurs(Kod)
);

CREATE TABLE Lokal 
(
Lokalnummer int Not null auto_increment,
Namn varchar(50) NOT NULL,
AntalPlatser tinyint,
PRIMARY KEY(lokalnummer)
);
CREATE INDEX Namn ON Lokal(Namn);

CREATE TABLE KursLokal
(
Kurskod char(5) NOT NULL,
Lokalnummer int NOT NULL,
Datum Date NOT NULL,
Tid time NOT NULL,
primary key (Kurskod, Lokalnummer, Datum, Tid),
foreign key (Kurskod) references Kurs(Kod), 
foreign key (Lokalnummer) references Lokal(Lokalnummer) 
);

CREATE TABLE Avdelning 
(
Avdelningsnummer int PRIMARY KEY,
Namn varchar(50)
);

create index Namn on Avdelning(Namn);

create table Lärare
(
Anställningsnummer int PRIMARY KEY,
Avdelningsnummer int,
Förnamn varchar(50) NOT NULL,
Efternamn varchar (50) NOT NULL,
Epost varchar(50) NOT NULL,
Telefon char(12),
foreign key (Avdelningsnummer) references Avdelning(Avdelningsnummer)
);

create index Förnamn on Lärare(Förnamn);
create index Efternamn on Lärare(Efternamn);

CREATE TABLE Undervisar
(
Kurskod char(5) NOT NULL,
Anställningsnummer int not null,
primary key(Kurskod, Anställningsnummer),
foreign key (Kurskod) references Kurs(Kod),
foreign key (Anställningsnummer) references Lärare(Anställningsnummer)
);

