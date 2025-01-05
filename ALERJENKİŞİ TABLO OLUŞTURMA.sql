Create Table AlerjenKisi(
alerjenId INT,
kisiId INT,
PRIMARY KEY (alerjenId, kisiId ),
FOREIGN KEY (alerjenId) REFERENCES Alerjen(alerjenId),
FOREIGN KEY (kisiId ) REFERENCES Kisi(kisiId ),
);