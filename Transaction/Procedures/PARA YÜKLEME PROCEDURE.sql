CREATE PROCEDURE ParaYukle (
    @kisiId INT,
    @miktar FLOAT
)
AS
BEGIN
    -- Transaction ba�lat�l�r
    BEGIN TRANSACTION;

    BEGIN TRY
        -- Ki�inin kart bilgisi
        DECLARE @kartId INT;
        SELECT @kartId = kartId FROM Kisi WHERE kisiId = @kisiId;

        -- Bakiyeyi g�ncelle
        UPDATE YemekhaneKarti
        SET bakiye = bakiye + @miktar
        WHERE kartId = @kartId;

        -- ��lem kayd� eklenir
        INSERT INTO Islemler (kartId, kisiId, tip, tutar, tarih)
        VALUES (@kartId, @kisiId, 1, @miktar, GETDATE()); -- tip=1 para y�kleme

        PRINT '��lem ba�ar�l�: Para y�klendi.';

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Hata durumunda i�lem geri al�n�r
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
