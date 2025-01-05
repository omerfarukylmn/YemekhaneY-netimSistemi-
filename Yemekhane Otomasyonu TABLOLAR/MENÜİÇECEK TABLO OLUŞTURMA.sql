Create Table MenuIcecek(
menuId INT,
icecekId INT,
PRIMARY KEY (menuId, icecekId),
FOREIGN KEY (menuId) REFERENCES Menu(menuId),
FOREIGN KEY (icecekId) REFERENCES Icecek(icecekId),
);