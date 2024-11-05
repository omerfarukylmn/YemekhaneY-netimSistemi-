# YemekhaneYönetimSistemi-
Proje Sahipleri

	•	Azra Şahin
	•	Ayşe Ceren Tuncer
	•	Ömer Faruk Yelman

Proje Genel Tanımı

Bu proje, üniversite yemekhane sisteminin daha verimli yönetilmesini sağlamak amacıyla geliştirilmiştir. Sistem, üniversite mensuplarının (öğrenciler, öğretim üyeleri, personel) yemek ihtiyaçlarını düzenli bir şekilde karşılayabilmeleri için çeşitli fonksiyonlar sunar. Kullanıcılar, yemek menülerine erişebilir, yemek seçimlerini yapabilir, kartlarına bakiye yükleyebilir ve alerjen bilgilerini sistemde kontrol edebilir.

Fonksiyonel Gereksinimler

2.1 Kullanıcı Gereksinimleri

Sistem, aşağıdaki kullanıcı gereksinimlerini karşılamalıdır:

	•	Kullanıcı sisteme giriş yapabilmelidir (Öğrenci, Öğretim Üyesi veya Personel).
	•	Kullanıcılar kartlarına bakiye yükleyebilmelidir.
	•	Kullanıcılar, günlük menüde yer alan yemekleri görebilmelidir.
	•	Kullanıcılar, alerjen bilgilerine göre yemek seçiminde bilgilendirilmelidir.
	•	Kullanıcılar yemek seçtiklerinde, kart bakiyesinden yemek ücreti düşülmelidir.

2.2 Sistem Gereksinimleri

Sistem, aşağıdaki işlevleri desteklemelidir:

	•	Kullanıcı kayıt ve giriş işlemlerini yönetebilmelidir.
	•	Kullanıcıların kart bilgilerini (bakiye, yükleme miktarı ve tarih) yönetebilmelidir.
	•	Yemek menülerini güncelleyebilmeli ve alerjen içeren öğeleri kullanıcıya bildirebilmelidir.
	•	Stok durumunu kontrol etmeli ve stokta olmayan malzemeler için uyarı vermelidir.
	•	Yemek seçiminde kullanılan malzemelerin stok miktarlarını azaltmalıdır.

Teknik Gereksinimler

	•	Sistem veri tabanında aşağıdaki varlıkları barındırmalıdır: Öğretim Üyesi, Öğrenci, Personel, Kart, Menü, Yemek, Alerjen, Malzeme, İçecek ve Tatlı.
	•	Veritabanı, kullanıcı bilgilerini ve alerjen verilerini güvenli bir şekilde saklamalıdır.
	•	Her öğenin (yemek, içecek vb.) kalori bilgisi ve içeriği sistemde tutulmalıdır.
	•	Yemek seçiminde alerjen içeriyorsa kullanıcıya uyarı vermelidir.
	•	Kullanıcı oturumları güvenli bir şekilde yönetilmelidir.

Fonksiyonel Olmayan Gereksinimler

	•	Sistem, kullanıcı dostu ve erişilebilir bir arayüz sunmalıdır.
	•	Sistem, güvenli bir giriş ve işlem doğrulama mekanizması sağlamalıdır.
	•	Veritabanı, yüksek performanslı sorgular için optimize edilmelidir.
	•	Sistem, veri gizliliğini sağlamak için şifreleme mekanizmaları kullanmalıdır.

Kullanıcı Senaryoları

5.1 Kullanıcı Senaryosu 1: Yemek Seçimi

	1.	Kullanıcı sisteme giriş yapar.
	2.	Günlük yemek menüsü görüntülenir.
	3.	Kullanıcı bir yemek seçer.
	4.	Eğer yemek, kullanıcının alerjen bilgilerine göre uygunsa işlem onaylanır ve karttan bakiye düşülür.
	5.	Yemek malzemeleri stok miktarlarından düşülür.

5.2 Kullanıcı Senaryosu 2: Bakiye Yükleme

	1.	Kullanıcı, kartına bakiye yüklemek için ilgili menüye gider.
	2.	Yüklemek istediği miktarı belirler ve onaylar.
	3.	Yeni bakiye miktarı kart bilgilerine eklenir.
Varlık-İlişki Tablosu:

Varlık 1|	Varlık 2|	İlişki|
|--------|----------|-----------|
|Kişi|	Yemekhane Kartı|	Sahiptir (1-1)|
|Yemek|	Malzeme|	Kullanır (N-M)|
|Malzeme|	Alerjen|	Sebep (N-1)|
|Menü|	Yemek	|İçerir (1-N)|
|Menü	|İçecek|	İçerir (1-N)|
|Menü|	Tatlı|	İçerir (1-N)|
|Öğrenci/Öğretim Üyesi/Personel|	Yemekhane Kartı|	Sahip (1-1)|
|Yemekhane Kartı|	Yükleme|	Yükleme Tarihi ve Miktarı|



![VERİ TABANI ER DİYAGRAMI (3)](https://github.com/user-attachments/assets/9fb43a8b-c218-463d-9529-21c3a71fc97a)







