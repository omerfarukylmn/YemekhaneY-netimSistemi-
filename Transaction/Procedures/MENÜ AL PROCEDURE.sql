CREATE PROCEDURE MenuAl (
    @kisiId INT, 
    @menuId INT
)
AS
BEGIN
    -- Transaction baþlatýlýr
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Kiþinin rolüne göre iskonto oranýný bul
        DECLARE @iskontoOrani FLOAT;
        SELECT @iskontoOrani = CASE 
            WHEN EXISTS (SELECT 1 FROM Ogrenci WHERE kisiId = @kisiId) THEN (SELECT iskontoOrani FROM Ogrenci WHERE kisiId = @kisiId)
            WHEN EXISTS (SELECT 1 FROM OgretimUyesi WHERE kisiId = @kisiId) THEN (SELECT iskontoOrani FROM OgretimUyesi WHERE kisiId = @kisiId)
            WHEN EXISTS (SELECT 1 FROM Personel WHERE kisiId = @kisiId) THEN (SELECT iskontoOrani FROM Personel WHERE kisiId = @kisiId)
            ELSE 0 -- Eðer kiþi bir role sahip deðilse iskonto yok
        END;

        -- Menü fiyatýný bul
        DECLARE @menuFiyat FLOAT;
        SELECT @menuFiyat = fiyat FROM Menu WHERE menuId = @menuId;

        -- Ýndirim uygulanmýþ fiyatý hesapla
        DECLARE @odeme FLOAT = @menuFiyat * (1 - @iskontoOrani);

        -- Kiþinin kart bilgisi ve mevcut bakiyesi
        DECLARE @kartId INT, @bakiye FLOAT;
        SELECT @kartId = kartId FROM Kisi WHERE kisiId = @kisiId;
        SELECT @bakiye = bakiye FROM YemekhaneKarti WHERE kartId = @kartId;

        -- Bakiye kontrolü
        IF @bakiye >= @odeme
        BEGIN
            -- Ödeme yapýlýr, bakiye güncellenir
            UPDATE YemekhaneKarti
            SET bakiye = bakiye - @odeme
            WHERE kartId = @kartId;

            -- Ýþlem kaydý eklenir
            INSERT INTO Islemler (kartId, kisiId, tip, tutar, tarih)
            VALUES (@kartId, @kisiId, 0, @odeme, GETDATE()); -- tip=0 harcama

            PRINT 'Ýþlem baþarýlý: Menü satýn alýndý.';
        END
        ELSE
        BEGIN
            -- Yetersiz bakiye uyarýsý
            PRINT 'Hata: Yetersiz bakiye.';
            ROLLBACK TRANSACTION;
            RETURN;
        END;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Hata durumunda iþlem geri alýnýr
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;

