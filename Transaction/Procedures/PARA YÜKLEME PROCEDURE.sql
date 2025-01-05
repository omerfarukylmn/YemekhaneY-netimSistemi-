CREATE PROCEDURE ParaYukle (
    @kisiId INT,
    @miktar FLOAT
)
AS
BEGIN
    -- Transaction baþlatýlýr
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Kiþinin kart bilgisi
        DECLARE @kartId INT;
        SELECT @kartId = kartId FROM Kisi WHERE kisiId = @kisiId;

        -- Bakiyeyi güncelle
        UPDATE YemekhaneKarti
        SET bakiye = bakiye + @miktar
        WHERE kartId = @kartId;

        -- Ýþlem kaydý eklenir
        INSERT INTO Islemler (kartId, kisiId, tip, tutar, tarih)
        VALUES (@kartId, @kisiId, 1, @miktar, GETDATE()); -- tip=1 para yükleme

        PRINT 'Ýþlem baþarýlý: Para yüklendi.';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Hata durumunda iþlem geri alýnýr
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
