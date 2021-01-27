CREATE DATABASE examenvoorbereiding2021;

 

CREATE TABLE klant (
    klantcode int NOT NULL,
    voorletters varchar(255),
    tussenvoegsels varchar(255),
    achternaam varchar(255),
    adres varchar(255),
    postcode varchar(255),
    woonplaats varchar(255),
    geboortedatum DATE,
    gebruikersnaam varchar(255),
    wachtwoord varchar(255),
    PRIMARY KEY(klantcode)
);

 

CREATE TABLE factuur (
    factuurnummer INT NOT NULL,
    factuurdatum DATETIME,
    klantcode INT,
    PRIMARY KEY(factuurnummer),
    FOREIGN KEY(klantcode) REFERENCES klant(klantcode)
);

 

CREATE TABLE artikel(
    artikelcode INT NOT NULL,
    artikel VARCHAR(255),
    prijs DECIMAL(5,2),
    PRIMARY KEY(artikelcode)   
);

 

CREATE TABLE factuurregel(
    factuurnummer INT NOT NULL,
    artikelcode INT,
    aantal INT,
    prijs DECIMAL(5,2),
    PRIMARY KEY(factuurnummer),
    FOREIGN KEY(artikelcode) REFERENCES artikel(artikelcode)    
);

 

CREATE TABLE winkel(
    winkelcode INT NOT NULL,
    winkelnaam VARCHAR(255),
    winkeladres VARCHAR(255),
    winkelpostcode VARCHAR(255),
    vestigingsplaats VARCHAR(255),
    telefoonnummer INT,
    PRIMARY KEY(winkelcode)
);

 

CREATE TABLE medewerker(
    medewerkerscode INT NOT NULL,
    voorletters VARCHAR(255),
    voorvoegsels VARCHAR(255),
    achternaam VARCHAR(255),
    gebruikersnaam VARCHAR(255),
    wachtwoord VARCHAR(255),
    PRIMARY KEY(medewerkerscode)
);

 

CREATE TABLE bestelling(
    artikelcode INT NOT NULL,
    winkelcode INT,
    aantal INT,
    klantcode INT,
    medewerkerscode INT,
    afgehaald DATETIME,
    FOREIGN KEY artikelcode REFERENCES artikel(artikelcode),
    FOREIGN KEY winkelcode REFERENCES winkel(winkelcode),
    FOREIGN KEY klantcode REFERENCES klant(klantcode),
    FOREIGN KEY medewerkerscode REFERENCES medewerker(medewerkerscode)
);