
-- Para yükleme iþlemi öncesinde bakiyeyi kontrol et
DECLARE @oncekiBakiye FLOAT, @guncelBakiye FLOAT;

-- Kiþinin mevcut bakiyesini al
SELECT @oncekiBakiye = bakiye
FROM YemekhaneKarti 
WHERE kartId = (SELECT kartId FROM Kisi WHERE kisiId = 1);

PRINT 'Para yüklemeden önceki bakiye: ' + CAST(@oncekiBakiye AS VARCHAR);

-- Para yükleme iþlemi
EXEC ParaYukle @kisiId = 1, @miktar = 100;

-- Para yükleme sonrasý bakiyeyi al
SELECT @guncelBakiye = bakiye
FROM YemekhaneKarti
WHERE kartId = (SELECT kartId FROM Kisi WHERE kisiId = 1);

PRINT 'Para yükleme sonrasý bakiye: ' + CAST(@guncelBakiye AS VARCHAR);




-- Menü satýn alma iþlemi öncesinde bakiyeyi kontrol et
DECLARE @oncekiBakiyeMenu FLOAT, @guncelBakiyeMenu FLOAT;

-- Kiþinin mevcut bakiyesini al
SELECT @oncekiBakiyeMenu = bakiye
FROM YemekhaneKarti
WHERE kartId = (SELECT kartId FROM Kisi WHERE kisiId = 1);

PRINT 'Menü satýn almadan önceki bakiye: ' + CAST(@oncekiBakiyeMenu AS VARCHAR);

-- Menü satýn alma iþlemi
EXEC MenuAl @kisiId = 1, @menuId = 1;

-- Menü satýn alma sonrasý bakiyeyi al
SELECT @guncelBakiyeMenu = bakiye
FROM YemekhaneKarti
WHERE kartId = (SELECT kartId FROM Kisi WHERE kisiId = 1);

PRINT 'Menü satýn alma sonrasý bakiye: ' + CAST(@guncelBakiyeMenu AS VARCHAR);
