DROP TABLE IF EXISTS Spezialisierung CASCADE;
DROP TABLE IF EXISTS Rolle CASCADE;
DROP TABLE IF EXISTS Mitarbeiter CASCADE;
DROP TABLE IF EXISTS Patient CASCADE;
DROP TABLE IF EXISTS Medikament CASCADE;
DROP TABLE IF EXISTS Diagnose CASCADE;
DROP TABLE IF EXISTS Dokumentation CASCADE;
DROP TABLE IF EXISTS DRG CASCADE;
DROP TABLE IF EXISTS Abrechnung CASCADE;
DROP TABLE IF EXISTS Behandlung CASCADE;
DROP TABLE IF EXISTS ausfuehren CASCADE;
DROP TABLE IF EXISTS erstellen CASCADE;
DROP TABLE IF EXISTS Medikation CASCADE;



CREATE TABLE Rolle(
	RollenNr INT PRIMARY KEY,
	Beschreibung VARCHAR(39)
	);


CREATE TABLE Spezialisierung(
	SpezNr INT PRIMARY KEY,
	RollenNr INT REFERENCES Rolle ON DELETE CASCADE,
	Beschreibung VARCHAR(39)
	);
	


CREATE TABLE Mitarbeiter(
	PersNr INT PRIMARY KEY,
	SpezNr INT REFERENCES Spezialisierung ON DELETE CASCADE,
	Vorname VARCHAR(39),
	Nachname VARCHAR(39),
    PLZ INT,
    Strasse VARCHAR(39),
    Ort VARCHAR(39),
	PW VARCHAR(39)
	);
	
CREATE TABLE Patient(
	PID SERIAL PRIMARY KEY,
	Vorname VARCHAR(39),
	Nachname VARCHAR(39),
	Strasse VARCHAR(39),
	PLZ INT,
	Ort VARCHAR(39),
	GebDatum DATE,
	Krk VARCHAR(39),
	KrkNr VARCHAR(39),
	Tel VARCHAR(39) --das ist neu
	);
	
CREATE TABLE Medikament(
	MedID INT PRIMARY KEY,
	Preis INT,
	Beschreibung VARCHAR(39)
	);
	
CREATE TABLE Diagnose(
	DiagID INT PRIMARY KEY,
	----------------------------------------------PersNr INT REFERENCES Mitarbeiter ON DELETE CASCADE,
	Syndrom VARCHAR(255),
	Symptome VARCHAR(255)
	);
	
CREATE TABLE Dokumentation(
	DokNr INT PRIMARY KEY,
	PersNr INT REFERENCES Mitarbeiter ON DELETE CASCADE,
	Art VARCHAR(39),
	Datum DATE,
	Beschreibung VARCHAR(3000)
	);

CREATE TABLE DRG(
	DRGID INT PRIMARY KEY,
	Beschreibung VARCHAR(255),
	Preis FLOAT
	);
	

	
CREATE TABLE Behandlung(
	BehNr INT PRIMARY KEY,
	PID INT REFERENCES Patient ON DELETE CASCADE,
	-----------------------------------------------PersNr INT REFERENCES Mitarbeiter ON DELETE CASCADE,
	DokNr INT REFERENCES Dokumentation ON DELETE CASCADE,
	DRGID INT REFERENCES DRG ON DELETE CASCADE,
	-----------------------------------------------MedID INT REFERENCES Medikament ON DELETE CASCADE,
	Datum DATE,
	BehStart TIME,
	BehEnde TIME
	);
	
CREATE TABLE Abrechnung( 
	AbrID INT PRIMARY KEY,
	BehNr INT REFERENCES Behandlung ON DELETE CASCADE,
	Datum DATE,
	Summe FLOAT
	);
	
	
CREATE TABLE ausfuehren(
	PersNr INT REFERENCES Mitarbeiter ON DELETE CASCADE,
	BehNr INT REFERENCES Behandlung ON DELETE CASCADE,
	PRIMARY KEY (PersNr, BehNr)
	);
	
CREATE TABLE erstellen(
	PersNr INT REFERENCES Mitarbeiter ON DELETE CASCADE,
	DiagID INT REFERENCES Diagnose ON DELETE CASCADE,
	PRIMARY KEY (PersNr, DiagID)
	);
	
CREATE TABLE Medikation( ---kann man auch mit medikID machen
	MedID INT REFERENCES Medikament ON DELETE CASCADE,
	BehNr INT REFERENCES Behandlung ON DELETE CASCADE,
	Menge INT,
	PRIMARY KEY (MedID, BehNr)
	);
	





	

	
	

	

