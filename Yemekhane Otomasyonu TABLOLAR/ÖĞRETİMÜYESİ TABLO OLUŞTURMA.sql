Create Table OgretimUyesi(
sicilNo INT PRIMARY KEY,
bolum NVARCHAR(50),
fakulte NVARCHAR(50),
iskontoOrani FLOAT,
kisiId INT,
FOREIGN KEY(kisiId) REFERENCES Kisi(kisiId)
);