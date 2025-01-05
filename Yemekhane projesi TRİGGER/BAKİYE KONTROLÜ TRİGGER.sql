CREATE TRIGGER BakiyeKontrolTrigger
ON YemekhaneKarti
AFTER UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM YemekhaneKarti
        WHERE bakiye < 0
    )
    BEGIN
        PRINT 'UYARI: Negatif bakiye tespit edildi. Ýþlem iptal ediliyor.';
        ROLLBACK TRANSACTION;
    END;
END;
