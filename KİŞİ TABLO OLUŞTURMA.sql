Create Table Kisi(
kisiId INT IDENTITY(1,1) PRIMARY KEY,
adi NVARCHAR(50),
soyadi NVARCHAR(50),
email NVARCHAR(50),
sifre NVARCHAR(20),
kartId INT,
tur NVARCHAR(20),
FOREIGN KEY(kartId) REFERENCES YemekhaneKarti(kartId)
);