CREATE DATABASE FailSafeIT1;
GO
USE FailSafeIT1;
GO

CREATE TABLE [Kunder] (
  [Organisationsnummer] VARCHAR(11) NOT NULL,
  [Företagsnamn] NVARCHAR(100) NOT NULL,
  [Epost] NVARCHAR(100) NOT NULL,
  [Telefonnummer] NVARCHAR(50) NOT NULL,
  PRIMARY KEY ([Organisationsnummer])
);

CREATE TABLE [Konsulter] (
  [Personnummer] VARCHAR(13)  NOT NULL,
  [Namn] NVARCHAR(100)  NOT NULL,
  [Timpris] INT  NOT NULL,
  [Specialitet] NVARCHAR(100)  NOT NULL,
  PRIMARY KEY ([Personnummer])
);

CREATE TABLE [Uppdrag] (
  [UppdragsId] INT  NOT NULL,
  [Organisationsnummer] VARCHAR(11)  NOT NULL,
  [Personnummer] VARCHAR(13)  NOT NULL,
  [Startdatum] DATETIME2  NOT NULL,
  [Slutdatum] DATETIME2  NOT NULL,
  [Rollbeskrivning] NVARCHAR(1000)  NOT NULL,
  PRIMARY KEY ([UppdragsId]),
  CONSTRAINT [FK_Uppdrag_Organisationsnummer]
    FOREIGN KEY ([Organisationsnummer])
      REFERENCES [Kunder]([Organisationsnummer]),
  CONSTRAINT [FK_Uppdrag_Personnummer]
    FOREIGN KEY ([Personnummer])
      REFERENCES [Konsulter]([Personnummer])
);
GO

INSERT INTO Kunder(Organisationsnummer, Företagsnamn, Epost, Telefonnummer)
VALUES ('558138-8138', 'Göteborgs Teknikservice AB', 'info@teknikservice.se', '0721123456'),
       ('558745-1081', 'SecureNet AB', 'info@securenet.com', '0708987654'),
       ('558761-1234','CloudCore Tech AB','info@cloudcore.com','0712789456')
GO
INSERT INTO Konsulter(Personnummer, Namn, Timpris, Specialitet)
VALUES ('19900110-1234', 'Erik Andersson', 1300, 'C# Developer'),
       ('19850501-9876', 'Sofia Nilsson', 1400, 'IT-Projektledning'),
       ('19950201-4561', 'Lina Svensson', 1100, 'UX/UI Design')
GO
INSERT INTO Uppdrag(UppdragsId, Organisationsnummer, Personnummer, Startdatum, Slutdatum, Rollbeskrivning)
VALUES (1, '558138-8138', '19900110-1234', '2026-10-01', '2027-03-31', 'Utveckling av mobilapp'),
       (2, '558138-8138', '19850501-9876', '2026-11-01', '2027-04-30', 'IT-projektledning'),
       (3, '558745-1081', '19950201-4561', '2026-12-01', '2027-05-31', 'UX/UI-design och prototyputveckling'),
       (4, '558745-1081', '19900110-1234', '2027-01-01', '2027-06-30', 'Backendutveckling och API-integration'),
       (5, '558761-1234', '19850501-9876', '2027-02-01', '2027-07-31', 'Teknisk projektledning och systemanalys')
GO

SELECT Namn, Timpris
From Konsulter
WHERE Timpris > 1200
ORDER BY Timpris DESC
GO

SELECT K.Företagsnamn, Ko.Namn, U.Startdatum, U.Slutdatum
FROM Uppdrag U
INNER JOIN Kunder K
ON U.Organisationsnummer = K.Organisationsnummer
INNER JOIN Konsulter Ko
ON U.Personnummer = Ko.Personnummer
ORDER BY K.Företagsnamn
GO
  
SELECT K.Företagsnamn, COUNT(*) AS AntalUppdrag
FROM Uppdrag U
INNER JOIN Kunder K
ON U.Organisationsnummer = K.Organisationsnummer
GROUP BY K.Organisationsnummer, K.Företagsnamn
ORDER BY K.Företagsnamn
GO
  
UPDATE Konsulter
SET Timpris = 1350
WHERE Personnummer = '19950201-4561'
GO

INSERT INTO Kunder(Organisationsnummer, Företagsnamn, Epost, Telefonnummer)
VALUES('550101-0101','SecureIT','info@secureit.com','0701010203')
GO

SELECT * 
FROM Kunder 
GO
  
DELETE FROM Kunder
WHERE Organisationsnummer = '550101-0101'

