CREATE TABLE Islemler (
    Islem_ID INT IDENTITY(1,1) PRIMARY KEY, -- Benzersiz i�lem kimli�i
    Kart_ID INT NOT NULL,                   -- Kart ID
    K_ID INT NOT NULL,                      -- Ki�i ID
    tip BIT NOT NULL,                       -- ��lem t�r� (1 = Para y�kleme, 0 = Harcama)
    tutar FLOAT NOT NULL,                   -- ��lem tutar�
    tarih DATE NOT NULL,                    -- ��lem tarihi
    FOREIGN KEY (Kart_ID) REFERENCES YemekhaneKarti(Kart_ID),
    FOREIGN KEY (K_ID) REFERENCES�Kisi(K_ID)
);