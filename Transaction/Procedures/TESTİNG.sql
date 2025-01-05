
-- Para y�kleme i�lemi �ncesinde bakiyeyi kontrol et
DECLARE @oncekiBakiye FLOAT, @guncelBakiye FLOAT;

-- Ki�inin mevcut bakiyesini al
SELECT @oncekiBakiye = bakiye
FROM YemekhaneKarti 
WHERE kartId = (SELECT kartId FROM Kisi WHERE kisiId = 1);

PRINT 'Para y�klemeden �nceki bakiye: ' + CAST(@oncekiBakiye AS VARCHAR);

-- Para y�kleme i�lemi
EXEC ParaYukle @kisiId = 1, @miktar = 100;

-- Para y�kleme sonras� bakiyeyi al
SELECT @guncelBakiye = bakiye
FROM YemekhaneKarti
WHERE kartId = (SELECT kartId FROM Kisi WHERE kisiId = 1);

PRINT 'Para y�kleme sonras� bakiye: ' + CAST(@guncelBakiye AS VARCHAR);




-- Men� sat�n alma i�lemi �ncesinde bakiyeyi kontrol et
DECLARE @oncekiBakiyeMenu FLOAT, @guncelBakiyeMenu FLOAT;

-- Ki�inin mevcut bakiyesini al
SELECT @oncekiBakiyeMenu = bakiye
FROM YemekhaneKarti
WHERE kartId = (SELECT kartId FROM Kisi WHERE kisiId = 1);

PRINT 'Men� sat�n almadan �nceki bakiye: ' + CAST(@oncekiBakiyeMenu AS VARCHAR);

-- Men� sat�n alma i�lemi
EXEC MenuAl @kisiId = 1, @menuId = 1;

-- Men� sat�n alma sonras� bakiyeyi al
SELECT @guncelBakiyeMenu = bakiye
FROM YemekhaneKarti
WHERE kartId = (SELECT kartId FROM Kisi WHERE kisiId = 1);

PRINT 'Men� sat�n alma sonras� bakiye: ' + CAST(@guncelBakiyeMenu AS VARCHAR);
