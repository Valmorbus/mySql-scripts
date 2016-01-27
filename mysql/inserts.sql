Use Skola;

-- Sätter kurs
Insert into Kurs (Kod, Namn, Startdatum, Poäng)
values('JVG', 'Java Grund',  20150822, 50);
Insert into Kurs (Kod, Namn, Startdatum, Poäng)
values('CSG', 'C# Grund',  20150822, 50);
Insert into Kurs (Kod, Namn, Startdatum, Poäng)
values('DBAS', 'Databas',  20160113, 30);
Insert into Kurs (Kod, Namn, Startdatum, Poäng)
values('FEND', 'Frontend',  20160305, 20);
Insert into Kurs (Kod, Namn, Startdatum, Poäng)
values('BEND', 'Backend',  20160305, 40);

-- Sätter Klass
Insert into Klass(Kod, Namn, Årskurs)
Values ('JAV15', 'JAVA15', 2015);
Insert into Klass(Kod, Namn, Årskurs)
Values ('CS15', 'C#15', 2015);
Insert into Klass(Kod, Namn, Årskurs)
Values ('CS14', 'C#14', 2014);
Insert into Klass(Kod, Namn, Årskurs)
Values ('JAV14', 'Java14', 2014);
Insert into Klass(Kod, Namn, Årskurs)
Values ('CS16', 'C#16', 2016);

-- Sätter koppling kurs och klass
Insert into KlassKurs(KursKod, KlassKod)
Values ('JVG', 'JAV15');
Insert into KlassKurs(KursKod, KlassKod)
Values ('DBAS', 'JAV15');
Insert into KlassKurs(KursKod, KlassKod)
Values ('BEND', 'JAV14');
Insert into KlassKurs(KursKod, KlassKod)
Values ('CSG', 'CS15');
Insert into KlassKurs(KursKod, KlassKod)
Values ('JVG', 'JAV14');

-- Sätter elev
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('8501200391', 'Simon', 'Borgström', 'borgstrom.simon@gmail.com', '0705566544', 'JAV15');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('9011210442', 'Sara', 'Larsson', 'Larson.Sara@Yahoo.com', '086447844', 'JAV15');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Klasskod)
values ('779423XXXX', 'Pelle', 'Pellesson', 'haxor@haxxmail.com', 'JAV15');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('9205110569', 'Sofie', 'Stödstrumpa', 'soso@gmail.com', '086436767', 'JAV15');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('8006050459', 'Simon', 'Karlsson', 'Karlsson.simon@gmail.com', '070566766', 'JAV15');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('8204044478', 'Karl', 'Karlsson', 'kk@gmail.com', '072334455', 'CS15');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('9501030890', 'Mia', 'Miasson', 'miamia@gmail.com', '08868686', 'CS15');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('8903302151', 'Sven', 'Svensson', 'ssofficer@gmail.com', '078434356', 'CS15');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('5506060344', 'Lotta', 'Lottasson', 'll@yahoo.com', '086456464', 'CS14');
Insert into Elev (Personnummer, Förnamn, Efternamn, Epost, Telefon, Klasskod)
values ('8903420391', 'Lotta', 'Lottasson', 'llson@yahoo.com', '086456464', 'CS14');

-- Sätter lokal
Insert into lokal (Namn, AntalPlatser)
values ('Stora salen', 12);
Insert into lokal (Namn, AntalPlatser)
values ('Lilla salen', 120);
Insert into lokal (Namn, AntalPlatser)
values ('Matsalen', 50);

-- Sätter avdelning
Insert into Avdelning (Avdelningsnummer, Namn)
values (1, 'IT sektionen');
Insert into Avdelning (Avdelningsnummer, Namn)
values (2, 'Bygg sektionen');
Insert into Avdelning (Avdelningsnummer, Namn)
values (3, 'Företagssektionen');

-- Sätter lärare
Insert into Lärare(Anställningsnummer, Avdelningsnummer, Förnamn, Efternamn, Epost, Telefon)
values (4545, 1, 'Jonas', 'Kjelman', 'j.kjelman@skola.se', 0756654433);
Insert into Lärare(Anställningsnummer, Avdelningsnummer, Förnamn, Efternamn, Epost)
values (4550, 1, 'Eywind', 'Eywindsson', 'ee@skola.se');
Insert into Lärare(Anställningsnummer, Avdelningsnummer, Förnamn, Efternamn, Epost, Telefon)
values (1337, 2, 'Byggar', 'Bob', 'bb@skola.se', 0757655432);

-- Sätter lokalbokningar
insert into KursLokal (KursKod, Lokalnummer, Datum, Tid)
values ('JVG', 1, '2016-01-26', '16:00');
insert into KursLokal (KursKod, Lokalnummer, Datum, Tid)
values ('CSG', 2, '2016-01-26', '16:00');
insert into KursLokal (KursKod, Lokalnummer, Datum, Tid)
values ('DBAS', 1, '2016-01-26', '11:00');
insert into KursLokal (KursKod, Lokalnummer, Datum, Tid)
values ('JVG', 3, '2016-01-26', '12:00');
insert into KursLokal (KursKod, Lokalnummer, Datum, Tid)
values ('CSG', 3, '2016-01-27', '12:00');
insert into KursLokal (KursKod, Lokalnummer, Datum, Tid)
values ('FEND', 1, '2016-01-26', '10:00');
insert into KursLokal (KursKod, Lokalnummer, Datum, Tid)
values ('CSG', 1, '2016-01-26', '10:00');

-- Sätter undervisar kurs
insert into Undervisar(Kurskod, Anställningsnummer)
values ('DBAS', 4545);
insert into Undervisar(Kurskod, Anställningsnummer)
values ('JVG', 4550);
insert into Undervisar(Kurskod, Anställningsnummer)
values ('CSG', 1337);
insert into Undervisar(Kurskod, Anställningsnummer)
values ('FEND', 4545);

-- Sätter betyg
Insert into KursBetyg(Personnummer, Kurskod, Betyg)
values ('8501200391', 'DBAS', 'VG');
Insert into KursBetyg(Personnummer, Kurskod, Betyg)
Values ('8501200391', 'JVG', 'VG');
Insert into KursBetyg(Personnummer, Kurskod, Betyg)
Values ('9011210442', 'JVG', 'G');
Insert into KursBetyg(Personnummer, Kurskod, Betyg)
Values ('9011210442', 'DBAS', 'F');
Insert into KursBetyg(Personnummer, Kurskod, Betyg)
Values ('779423XXXX', 'JVG', 'G');
Insert into KursBetyg(Personnummer, Kurskod, Betyg)
Values ('9501030890', 'JVG', 'G');
Insert into KursBetyg(Personnummer, Kurskod, Betyg)
Values ('9501030890', 'DBAS', 'VG');



