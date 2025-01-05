Create Table YemekMalzeme(
yemekId INT,
malzemeId INT,
PRIMARY KEY (yemekId, malzemeId),
FOREIGN KEY (yemekId) REFERENCES Yemek(yemekId),
FOREIGN KEY (malzemeId) REFERENCES Malzeme(malzemeId),
);
