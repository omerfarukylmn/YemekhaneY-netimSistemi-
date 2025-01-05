Create Table Ogrenci(
ogrenciNo INT PRIMARY KEY,
bolum NVARCHAR(50),
fakulte NVARCHAR(50),
sinif INT,
iskontoOrani FLOAT,
kisiId INT,
FOREIGN KEY(kisiId) REFERENCES Kisi(kisiId)
);