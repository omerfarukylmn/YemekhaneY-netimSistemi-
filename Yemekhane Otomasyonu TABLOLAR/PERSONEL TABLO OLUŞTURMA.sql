Create Table Personel(
personelId INT PRIMARY KEY,
departman NVARCHAR(50),
gorev NVARCHAR(50),
iskontoOrani FLOAT,
kisiId INT,
FOREIGN KEY(kisiId) REFERENCES Kisi(kisiId)
);