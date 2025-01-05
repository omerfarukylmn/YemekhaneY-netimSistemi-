Create Table MenuTatli(
menuId INT,
tatliId INT,
PRIMARY KEY (menuId, tatliId),
FOREIGN KEY (menuId) REFERENCES Menu(menuId),
FOREIGN KEY (tatliId) REFERENCES Tatli(tatliId),
);