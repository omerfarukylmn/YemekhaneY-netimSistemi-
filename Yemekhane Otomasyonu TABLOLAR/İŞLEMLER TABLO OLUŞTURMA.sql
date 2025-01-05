CREATE TABLE Islemler (
    Islem_ID INT IDENTITY(1,1) PRIMARY KEY, -- Benzersiz iþlem kimliði
    Kart_ID INT NOT NULL,                   -- Kart ID
    tip BIT NOT NULL,                       -- Ýþlem türü (1 = Para yükleme, 0 = Harcama)
    tutar FLOAT NOT NULL,                   -- Ýþlem tutarý
    tarih DATE NOT NULL,                    -- Ýþlem tarihi
    FOREIGN KEY (Kart_ID) REFERENCES YemekhaneKarti(Kart_ID),
);
