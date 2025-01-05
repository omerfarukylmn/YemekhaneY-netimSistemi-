CREATE PROCEDURE KisiEkle(
    @adi NVARCHAR(50),
    @soyadi NVARCHAR(50),
    @email NVARCHAR(50),
    @sifre NVARCHAR(20),
    @tur NVARCHAR(20), -- Tür bilgisi: 'Ogrenci', 'Personel', 'OgretimUyesi'
    @bolum NVARCHAR(50) = NULL, -- Fakülte ve bölümü almak için
    @fakulte NVARCHAR(50) = NULL,
    @sinif INT = NULL, -- Öðrenci için sýnýf
    @departman NVARCHAR(50) = NULL, -- Personel için departman
    @gorev NVARCHAR(50) = NULL -- Personel için görev
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Yemekhane Kartý ekleme: Bakiye 0 ve SKT bugün + 1 yýl
    INSERT INTO YemekhaneKarti (bakiye, skt)
    VALUES (0, DATEADD(YEAR, 1, GETDATE()));

    -- Eklenen Yemekhane Kartý ID'sini al
    DECLARE @kartId INT = SCOPE_IDENTITY();

    -- Kiþi ekleme
    INSERT INTO Kisi (adi, soyadi, email, sifre, kartId, tur)
    VALUES (@adi, @soyadi, @email, @sifre, @kartId, @tur);

    -- Eklenen Kiþi ID'sini al
    DECLARE @kisiId INT = SCOPE_IDENTITY();

    -- Türüne göre ilgili tabloya ekleme
    IF @tur = 'Ogrenci'
    BEGIN
        -- Mevcut en büyük ogrenciNo'yu al ve bir artýr
        DECLARE @ogrenciNo INT;
        SELECT @ogrenciNo = ISNULL(MAX(ogrenciNo), 0) + 1 FROM Ogrenci;

        -- Öðrenci ekle
        INSERT INTO Ogrenci (ogrenciNo, kisiId, bolum, fakulte, sinif, iskontoOrani)
        VALUES (@ogrenciNo, @kisiId, @bolum, @fakulte, @sinif, 0.20);
    END
    ELSE IF @tur = 'Personel'
    BEGIN
        -- Mevcut en büyük personelId'yi al ve bir artýr
        DECLARE @personelId INT;
        SELECT @personelId = ISNULL(MAX(personelId), 0) + 1 FROM Personel;

        -- Personel ekle
        INSERT INTO Personel (personelId, kisiId, departman, gorev, iskontoOrani)
        VALUES (@personelId, @kisiId, @departman, @gorev, 0.10);
    END
    ELSE IF @tur = 'OgretimUyesi'
    BEGIN
        -- Mevcut en büyük sicilNo'yu al ve bir artýr
        DECLARE @sicilNo INT;
        SELECT @sicilNo = ISNULL(MAX(sicilNo), 0) + 1 FROM OgretimUyesi;

        -- Öðretim Üyesi ekle
        INSERT INTO OgretimUyesi (sicilNo, kisiId, bolum, fakulte, iskontoOrani)
        VALUES (@sicilNo, @kisiId, @bolum, @fakulte, 0.30);
    END
END;
