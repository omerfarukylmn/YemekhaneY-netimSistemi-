CREATE PROCEDURE KisiEkle(
    @adi NVARCHAR(50),
    @soyadi NVARCHAR(50),
    @email NVARCHAR(50),
    @sifre NVARCHAR(20),
    @tur NVARCHAR(20), -- T�r bilgisi: 'Ogrenci', 'Personel', 'OgretimUyesi'
    @bolum NVARCHAR(50) = NULL, -- Fak�lte ve b�l�m� almak i�in
    @fakulte NVARCHAR(50) = NULL,
    @sinif INT = NULL, -- ��renci i�in s�n�f
    @departman NVARCHAR(50) = NULL, -- Personel i�in departman
    @gorev NVARCHAR(50) = NULL -- Personel i�in g�rev
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Yemekhane Kart� ekleme: Bakiye 0 ve SKT bug�n + 1 y�l
    INSERT INTO YemekhaneKarti (bakiye, skt)
    VALUES (0, DATEADD(YEAR, 1, GETDATE()));

    -- Eklenen Yemekhane Kart� ID'sini al
    DECLARE @kartId INT = SCOPE_IDENTITY();

    -- Ki�i ekleme
    INSERT INTO Kisi (adi, soyadi, email, sifre, kartId, tur)
    VALUES (@adi, @soyadi, @email, @sifre, @kartId, @tur);

    -- Eklenen Ki�i ID'sini al
    DECLARE @kisiId INT = SCOPE_IDENTITY();

    -- T�r�ne g�re ilgili tabloya ekleme
    IF @tur = 'Ogrenci'
    BEGIN
        -- Mevcut en b�y�k ogrenciNo'yu al ve bir art�r
        DECLARE @ogrenciNo INT;
        SELECT @ogrenciNo = ISNULL(MAX(ogrenciNo), 0) + 1 FROM Ogrenci;

        -- ��renci ekle
        INSERT INTO Ogrenci (ogrenciNo, kisiId, bolum, fakulte, sinif, iskontoOrani)
        VALUES (@ogrenciNo, @kisiId, @bolum, @fakulte, @sinif, 0.20);
    END
    ELSE IF @tur = 'Personel'
    BEGIN
        -- Mevcut en b�y�k personelId'yi al ve bir art�r
        DECLARE @personelId INT;
        SELECT @personelId = ISNULL(MAX(personelId), 0) + 1 FROM Personel;

        -- Personel ekle
        INSERT INTO Personel (personelId, kisiId, departman, gorev, iskontoOrani)
        VALUES (@personelId, @kisiId, @departman, @gorev, 0.10);
    END
    ELSE IF @tur = 'OgretimUyesi'
    BEGIN
        -- Mevcut en b�y�k sicilNo'yu al ve bir art�r
        DECLARE @sicilNo INT;
        SELECT @sicilNo = ISNULL(MAX(sicilNo), 0) + 1 FROM OgretimUyesi;

        -- ��retim �yesi ekle
        INSERT INTO OgretimUyesi (sicilNo, kisiId, bolum, fakulte, iskontoOrani)
        VALUES (@sicilNo, @kisiId, @bolum, @fakulte, 0.30);
    END
END;
