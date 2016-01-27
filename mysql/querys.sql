Use Skola;

-- uppg 1
Select Elev.Förnamn, Elev.Efternamn, Klass.namn from elev 
USE INDEX(Efternamn)
inner join klass on klass.kod=elev.Klasskod
Order By Elev.efternamn;

-- Uppg 2
Select Lärare.Efternamn, Lärare.Förnamn, Avdelning.Namn from Lärare
inner join Avdelning 
on Lärare.Avdelningsnummer = avdelning.Avdelningsnummer;

-- Uppg 3
Select Klass.namn as 'Klassnamn', kurs.namn as 'kursnamn', lokal.namn as 'lokalnamn', kurslokal.tid, kurslokal.datum from kurs
inner join klasskurs on klasskurs.KursKod = Kurs.Kod 
inner join klass on klass.kod = klasskurs.KlassKod
inner join kurslokal on kurs.kod = kurslokal.Kurskod
inner join lokal on lokal.Lokalnummer = kurslokal.Lokalnummer
Order by Datum, tid;

-- Uppg 4
-- kolla upp hur det bör göras utan mysql dialekt
Select lokal.*, kurslokal.Datum, kurslokal.tid
from lokal, Kurslokal 
where lokal.Lokalnummer != Kurslokal.Lokalnummer and kurslokal.tid <'12:00' and kurslokal.tid >'9:00'
and kurslokal.Datum = '2016-01-26'; 

-- inre fråga 
Select lokal.* from lokal where lokal.Lokalnummer not in 
(select lokal.lokalnummer from lokal
inner join Kurslokal on lokal.lokalnummer = kurslokal.lokalnummer
where kurslokal.datum =  '2016-01-26' and kurslokal.tid >'9:00' and kurslokal.tid<'12:00');

-- uppg 5
-- få ut data
Select avg(length(Betyg)) as 'Snittbetyg' from KursBetyg, kurs 
where kursbetyg.Kurskod = 'JVG'; -- ger längden på char i snitt...DBAS

-- lägger till ett nytt table för det hela
Create table betygvärde
(
betyg char(2) primary key,
värde tinyint not null
);
 -- lägger till värden i nya table
insert into betygvärde values ('vg', 3);
insert into  betygvärde values ('g', 2);
insert into betygvärde values ('f', 1);

-- uppdaterar justerar
alter table kursbetyg 
add foreign key (betyg) references betygvärde(betyg);

-- jämför värdet i betygvärde och ger en siffra
Select betyg from betygvärde where värde = (
select round(avg(betygvärde.värde), 0) from kursbetyg  -- round avrundar
inner join betygvärde on kursbetyg.betyg = betygvärde.betyg
where kursbetyg.KursKod = 'DBAS'
);

-- ex som bara ger ett snitt av poäng i siffror
select avg(betygvärde.värde) from kursbetyg
inner join betygvärde on kursbetyg.betyg = betygvärde.Betyg
where kurskod = 'DBAS';


-- Uppg 6
Select distinct  Kursbetyg.*, Elev.Förnamn, Elev.Efternamn from KursBetyg, Elev 
where kursbetyg.kurskod = 'DBAS' and Betyg = 'VG' and Elev.Personnummer = Kursbetyg.personnummer ;

-- distinkt tar max ett ex av varje
Select distinct Kursbetyg.*, Elev.Förnamn, Elev.Efternamn from elev
inner join  KursBetyg on elev.personnummer = kursbetyg.Personnummer
where kursbetyg.kurskod = 'DBAS' and Betyg = 'VG' and Elev.Personnummer = Kursbetyg.personnummer ;

 select distinct * from kursbetyg
 where betyg = 'Vg';








Select * from kurslokal;

Select * from klasskurs;
Select * from Kurs where Poäng > 10;
Select * from Lokal;

-- Inner join
Select Elev.personnummer, Elev.förnamn, klass.namn from elev
inner join klass on klass.kod=elev.Klasskod;

-- Simple join
Select Klass.Namn, Elev.Förnamn, Elev.Efternamn from Klass, Elev where Klass.kod = Elev.Klasskod ;


-- Många till många 
Select Klass.namn, kurs.namn from kurs
inner join klasskurs on klasskurs.KursKod = Kurs.Kod 
inner join klass on klass.kod = klasskurs.KlassKod;

Select klass.namn, kurs.namn
from klass
inner join klasskurs on klass.kod = klasskurs.klasskod
inner join kurs on klasskurs.kurskod=kurs.kod;



-- Select * from klass where StartDatum > '2013-01-01' order by Kod;

-- delete from Elev where Personnummer = 'XXXX' And Efternamn = 'Sven';