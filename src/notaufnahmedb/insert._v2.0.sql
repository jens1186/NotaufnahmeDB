
DELETE FROM Rolle;
DELETE FROM Mitarbeiter;
DELETE FROM Spezialisierung;
DELETE FROM Patient;
DELETE FROM Medikament;
DELETE FROM Diagnose;
DELETE FROM Dokumentation;
DELETE FROM DRG;
DELETE FROM Behandlung;
DELETE FROM Abrechnung;


---------------Rolle--------------------
INSERT INTO Rolle(RollenNr, Beschreibung)
VALUES (1, 'Arzt');

INSERT INTO Rolle(RollenNr, Beschreibung)
VALUES (2, 'Assistent');



---------------Spezialisierung--------------------
INSERT INTO Spezialisierung(SpezNr, RollenNr, Beschreibung) 
VALUES (1,1, 'Internist');

INSERT INTO Spezialisierung(SpezNr, RollenNr, Beschreibung) 
VALUES (2,1, 'Chirurg');

INSERT INTO Spezialisierung(SpezNr, RollenNr, Beschreibung) 
VALUES (3,2, 'MTA');


---------------Mitarbeiter--------------------
INSERT INTO Mitarbeiter(PersNr, SpezNr, Vorname, Nachname, PLZ, Strasse, Ort, PW ) 
VALUES (1, 1,'Horst', 'Hansen', 10962, 'Edisonstrasse', 'Berlin', 'Start1234');

INSERT INTO Mitarbeiter(PersNr, SpezNr, Vorname, Nachname, PLZ, Strasse, Ort, PW ) 
VALUES (2, 3,'Peter', 'Griffin', 10562, 'Yorckstrasse 6', 'Berlin', 'Start1234');


---------------Patient--------------------
INSERT INTO Patient(Vorname, Nachname, Strasse, PLZ, Ort, Gebdatum, KRK, KrkNr, Tel ) 
VALUES ('Jesse', 'Pinkman',  'Keinplan 10', 10162, 'Albuquerque', '1982-11-18', 'AOK', '123456', '8127734');

INSERT INTO Patient(Vorname, Nachname, Strasse, PLZ, Ort, Gebdatum, KRK, KrkNr, Tel ) 
VALUES ('Walter Hartwell', 'White', 'Keinestrasse 5', 10162, 'Albuquerque', '1960-11-18', 'SBK', '567898', '67877655');


--------------Medikament-------------------
INSERT INTO Medikament(MedID, Preis, Beschreibung) 
VALUES (1, 7, 'Paracetamol 500 Hexal');				

INSERT INTO Medikament(MedID, Preis, Beschreibung) 
VALUES (2, 5, 'Ibuprofen Atid 800');	



--------------Diagnose-------------------
INSERT INTO Diagnose(DiagID, Syndrom, Symptome ) 
VALUES (1,'Lungenkrebs', 'Starkes Husten ;) und sowas halt');

INSERT INTO Diagnose(DiagID, Syndrom, Symptome ) 
VALUES (2,'Junkie', 'Drauf');


--------------Dokumentation-------------------
INSERT INTO Dokumentation(DokNr, PersNr, Art, Datum, Beschreibung ) 
VALUES (1,2, 'Audio', '2013-09-30', 'Keine Beschreibung');

INSERT INTO Dokumentation(DokNr, PersNr, Art, Datum, Beschreibung ) 
VALUES (2,1, 'Audio+Bild ', '2013-09-05', 'Keine Beschreibung');


--------------DRG-------------------
INSERT INTO DRG(DRGID, Beschreibung, Preis ) 
VALUES (1,'Die DRGID muss varchar sein da die IDs im Katalog sehen so aus----A05C', 50000.00);

INSERT INTO DRG(DRGID, Beschreibung, Preis ) 
VALUES (2,'Beatmung---DGR---A07A', 10000.00);



-------------Behandlung-------------------
INSERT INTO Behandlung(BehNr, PID, DokNr, DRGID, Datum, BehStart, BehEnde ) 
VALUES (10,1,2,2,'2013-11-18','15:30:00', '02:30:00');

INSERT INTO Behandlung(BehNr, PID, DokNr, DRGID, Datum, BehStart, BehEnde ) 
VALUES (22,2,1,1,'2013-10-29','11:00:00', '22:30:00');


-------------Abrechnung-------------------	
INSERT INTO Abrechnung(AbrID, BehNr, Datum, Summe) 
VALUES (1,10,'2013-10-29',55000.00);

INSERT INTO Abrechnung(AbrID, BehNr, Datum, Summe) 
VALUES (2,22,'2013-10-29',30000.00);


-------------ausfuehren-------------------	
INSERT INTO ausfuehren(PersNr, BehNr)
VALUES (1,10);

INSERT INTO ausfuehren(PersNr, BehNr)
VALUES (2,22);

INSERT INTO ausfuehren(PersNr, BehNr)
VALUES (1,22);


-------------erstellen-------------------	
INSERT INTO erstellen(PersNr, DiagID)
VALUES (1,2);

INSERT INTO erstellen(PersNr, DiagID)
VALUES (2,1);


-------------Medikation-------------------	
INSERT INTO Medikation(MedID, BehNr, Menge)
VALUES (1,10, 300);

INSERT INTO Medikation(MedID, BehNr, Menge)
VALUES (2,10, 400);

INSERT INTO Medikation(MedID, BehNr, Menge)
VALUES (1,22, 100);







