Use Skola;

-- övning 1
Select * from klasskurs;
select count(*) from elev
inner join klass on klass.Kod = elev.Klasskod
inner join klasskurs on klass.kod = klasskurs.KlassKod
where klasskurs.KursKod = 'DBAS';

select count(*) as 'Total' from klass where klass.kod in (Select klass.Kod from klass 
inner join klasskurs on klass.kod = klasskurs.KlassKod
where klasskurs.KursKod = 'JVG')
group by 'Total';

-- övning 2
Alter table Lärare 
Add Lön int;

Update Lärare Set lön = 25000
 where lärare.förnamn = 'Jonas';
 Update Lärare Set lön = 10000
 where lärare.förnamn = 'Byggar';
 Update Lärare Set lön = 15000
 where lärare.förnamn = 'Eywind';
 
 select * from lärare;
 
 Select Avdelning.namn, avg(lön) as 'genomsnittslön', max(lön) as 'Maxlön' from lärare
 inner join Avdelning on lärare.avdelningsnummer = Avdelning.Avdelningsnummer
 group by Avdelning.Namn
 having avg(lön) > 10000;
 
 -- uppg 3
 Alter table Lärare 
Add Stad varchar(50);
Alter table Elev
Add Stad varchar(50);

Update Lärare Set Stad = 'Stockholm'
 where lärare.förnamn = 'Jonas';
 Update Lärare Set Stad = 'Uppsala'
 where lärare.förnamn = 'Byggar';
 Update Lärare Set Stad = 'Knivsta'
 where lärare.förnamn = 'Eywind';
 
 select * from elev;
 Update Elev Set Stad = 'Uppsala'
 where elev.Förnamn = 'Simon';
 Update Elev Set Stad = 'Stockholm'
 where elev.Förnamn = 'lotta';
 Update Elev Set Stad = 'Stockholm'
 where elev.Förnamn = 'Pelle';
 Update Elev Set Stad = 'Knivsta'
 where elev.Förnamn = 'Karl';
 Update Elev Set Stad = 'Stockholm'
 where elev.Förnamn = 'Sven';
 Update Elev Set Stad = 'Stockholm'
 where elev.Förnamn = 'Sara';
Update Elev Set Stad = 'Uppsala'
 where elev.Förnamn = 'Sofie';
 Update Elev Set Stad = 'Göteborg'
 where elev.Förnamn = 'Mia';
 
 
 Select Elev.förnamn, elev.efternamn from Elev
 where Stad = 'Uppsala'
 union 
 select Lärare.förnamn, lärare.efternamn from lärare 
 where stad = 'Uppsala';
 
 
 -- Uppg 4

insert into Lärare (Anställningsnummer, Avdelningsnummer, Förnamn, Efternamn, Epost, Telefon)
values (800, 3, 'Sven', 'Svensson', 'sven@banan.se', 086885656);

select lärare.efternamn, lärare.förnamn, undervisar.kurskod  from lärare
left join undervisar on lärare.anställningsnummer = undervisar.Anställningsnummer;