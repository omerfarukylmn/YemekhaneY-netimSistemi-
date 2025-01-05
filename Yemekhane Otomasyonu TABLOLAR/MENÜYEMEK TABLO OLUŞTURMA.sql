Create Table MenuYemek(
menuId INT,
yemekId INT,
PRIMARY KEY (menuId, yemekId),
FOREIGN KEY (menuId) REFERENCES Menu(menuId),
FOREIGN KEY (yemekId) REFERENCES Yemek(yemekId),
);