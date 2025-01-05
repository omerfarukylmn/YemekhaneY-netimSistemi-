Create Table AlerjenMalzeme(
alerjenId INT,
malzemeId INT,
PRIMARY KEY (alerjenId, malzemeId),
FOREIGN KEY (alerjenId) REFERENCES Alerjen(alerjenId),
FOREIGN KEY (malzemeId) REFERENCES Malzeme(malzemeId),
);