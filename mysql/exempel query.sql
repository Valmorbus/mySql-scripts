Use Skola;

-- explicit join
Select elev.personnummer, elev.förnamn, elev.efternamn, klass.namn from elev
inner join klass on elev.Klasskod = klass.kod;

Select elev.personnummer, elev.förnamn, elev.efternamn, klass.namn from elev, klass
where elev.klasskod = klass.kod; 

Select klass.namn, kurs.namn from klass
inner join klasskurs on klasskurs.KlassKod =klass.Kod
inner join kurs on klasskurs.KursKod = kurs.kod;

select * from elev
order by Förnamn
limit 5; 

select * from elev 
where förnamn in ('Simon');

select * from elev
where klasskod not in (select klass.Kod from klass where klass.kod = 'CS15');

Select * from elev
where exists (select * from klass
where klass.kod = elev.Klasskod);

Select * from lokal 
where Lokalnummer > all (select lärare.Anställningsnummer from lärare);

Select * from lokal 
where Lokalnummer > any (select lärare.Anställningsnummer from lärare);