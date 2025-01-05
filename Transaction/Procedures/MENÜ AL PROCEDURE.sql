CREATE PROCEDURE MenuAl (
    @kisiId INT, 
    @menuId INT
)
AS
BEGIN
    -- Transaction ba�lat�l�r
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Ki�inin rol�ne g�re iskonto oran�n� bul
        DECLARE @iskontoOrani FLOAT;
        SELECT @iskontoOrani = CASE 
            WHEN EXISTS (SELECT 1 FROM Ogrenci WHERE kisiId = @kisiId) THEN (SELECT iskontoOrani FROM Ogrenci WHERE kisiId = @kisiId)
            WHEN EXISTS (SELECT 1 FROM OgretimUyesi WHERE kisiId = @kisiId) THEN (SELECT iskontoOrani FROM OgretimUyesi WHERE kisiId = @kisiId)
            WHEN EXISTS (SELECT 1 FROM Personel WHERE kisiId = @kisiId) THEN (SELECT iskontoOrani FROM Personel WHERE kisiId = @kisiId)
            ELSE 0 -- E�er ki�i bir role sahip de�ilse iskonto yok
        END;

        -- Men� fiyat�n� bul
        DECLARE @menuFiyat FLOAT;
        SELECT @menuFiyat = fiyat FROM Menu WHERE menuId = @menuId;

        -- �ndirim uygulanm�� fiyat� hesapla
        DECLARE @odeme FLOAT = @menuFiyat * (1 - @iskontoOrani);

        -- Ki�inin kart bilgisi ve mevcut bakiyesi
        DECLARE @kartId INT, @bakiye FLOAT;
        SELECT @kartId = kartId FROM Kisi WHERE kisiId = @kisiId;
        SELECT @bakiye = bakiye FROM YemekhaneKarti WHERE kartId = @kartId;

        -- Bakiye kontrol�
        IF @bakiye >= @odeme
        BEGIN
            -- �deme yap�l�r, bakiye g�ncellenir
            UPDATE YemekhaneKarti
            SET bakiye = bakiye - @odeme
            WHERE kartId = @kartId;

            -- ��lem kayd� eklenir
            INSERT INTO Islemler (kartId, kisiId, tip, tutar, tarih)
            VALUES (@kartId, @kisiId, 0, @odeme, GETDATE()); -- tip=0 harcama

            PRINT '��lem ba�ar�l�: Men� sat�n al�nd�.';
        END
        ELSE
        BEGIN
            -- Yetersiz bakiye uyar�s�
            PRINT 'Hata: Yetersiz bakiye.';
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Hata durumunda i�lem geri al�n�r
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

