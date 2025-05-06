// lib/utils/localization/tr_tr.dart

const Map<String, String> trTR = {
  // General
  "general.appTitle": "İlaç Hatırlatıcı",
  "general.save": "Kaydet",
  "general.cancel": "İptal",
  "general.delete": "Sil",
  "general.edit": "Düzenle",
  "general.add": "Ekle",
  "general.confirm": "Onayla",
  "general.success": "Başarılı",
  "general.error": "Hata",
  "general.loading": "Yükleniyor...",
  "general.requiredField":
      "Bu alan zorunludur", // Note: removed tab from original \t
  // Auth
  "auth.login": "Giriş Yap",
  "auth.signup": "Kayıt Ol",
  "auth.logout": "Çıkış Yap",
  "auth.email": "E-posta",
  "auth.password": "Şifre",
  "auth.loginButton": "Giriş Yap",
  "auth.signupButton": "Kayıt Ol",
  "auth.loginErrorTitle": "Giriş Başarısız",
  "auth.signupErrorTitle": "Kayıt Başarısız",
  "auth.unknownError": "Bilinmeyen bir hata oluştu.",
  "auth.or": "VEYA",
  "auth.noAccount": "Hesabınız yok mu? Kayıt Olun",
  "auth.haveAccount": "Zaten hesabınız var mı? Giriş Yapın",

  // Home / Medicine List
  "home.title": "İlaçlarım",
  "home.addMedicine": "Yeni İlaç Ekle",
  "home.noMedicines":
      "Henüz ilaç eklenmemiş. Eklemek için + düğmesine dokunun!",
  "home.confirmDeleteTitle": "İlacı Sil",
  "home.confirmDeleteContent":
      "{medicineName} adlı ilacı silmek istediğinizden emin misiniz?",

  // Add/Edit Medicine Page
  "addMedicine.titleAdd": "İlaç Ekle",
  "addMedicine.titleEdit": "İlacı Düzenle",
  "addMedicine.nameLabel": "İlaç Adı",
  "addMedicine.nameHint": "Örn: Parasetamol",
  "addMedicine.typeLabel": "İlaç Türü/Kategorisi",
  "addMedicine.typeHint": "Örn: Hap, Şurup, Enjeksiyon",
  "addMedicine.dosageLabel": "Doz Miktarı", // Updated from "Dozaj"
  "addMedicine.dosageHint":
      "Örn: 1, 2, 500", // Updated from "Örn: 500mg, 1 tablet"
  "addMedicine.dosageUnitLabel": "Doz Birimi",
  "addMedicine.dosageUnitHint": "Örn: tablet, mL, mg",
  "addMedicine.frequencyLabel": "Sıklık",
  "addMedicine.frequencyHint": "Örn: Günlük, Günde iki kez",
  "addMedicine.durationLabel": "Süre (gün)",
  "addMedicine.durationHint": "Örn: 7, 14, 30 (devamlı için 0)",
  "addMedicine.whenToTakeLabel": "Alınma Zamanı / Notlar",
  "addMedicine.whenToTakeHint": "Örn: Yemekle, Yatmadan önce",
  "addMedicine.startDateLabel": "Başlangıç Tarihi",
  "addMedicine.endDateLabel": "Bitiş Tarihi (İsteğe bağlı)",
  "addMedicine.selectDate": "Tarih Seç",
  "addMedicine.selectTime": "Saat Seç",
  "addMedicine.timesLabel": "Günlük Doz Sayısı", // Updated from "Saatler"
  "addMedicine.addTime": "Saat Ekle",
  "addMedicine.notesLabel":
      "Ek Notlar (İsteğe bağlı)", // Updated from "Notlar (İsteğe bağlı)"
  "addMedicine.notesHint":
      "Örn: Serin yerde saklayın", // Updated from "Örn: Yemekle birlikte alın"
  "addMedicine.enableNotificationsLabel": "Doz Hatırlatıcılarını Etkinleştir",
  "addMedicine.errorNumeric": "Lütfen geçerli bir sayı girin",

  // Medicine Controller Messages
  "medicine.addSuccess": "İlaç başarıyla eklendi.",
  "medicine.updateSuccess": "İlaç başarıyla güncellendi.",
  "medicine.deleteSuccess": "İlaç başarıyla silindi.",
  "medicine.errorNeedTime": "Lütfen en az bir saat seçin.",

  // Settings Page
  "settings.title": "Ayarlar",
  "settings.language": "Dil",
  "settings.selectLanguage": "Dil Seçin",
  "settings.profile": "Profil",

  // Introduction Screen
  "introduction.skip": "Atla",
  "introduction.done": "Bitti",
  "introduction.next": "İleri",

  // Filter
  "filter.allTypes": "Tüm Tipler",
  "filter.uncategorized": "Kategorisiz",
  "filter.searchHint": "İlaç Ara...",
  "filter.noResultsForSearchAndType":
      "\"{query}\" için {type} tipinde sonuç bulunamadı",
  "filter.noResultsForSearch": "\"{query}\" için sonuç bulunamadı",
  "filter.noResultsForType": "\"{type}\" tipinde sonuç bulunamadı",

  // Medicine Card
  "card.treatmentCompleted": "Tedavi Tamamlandı",
  "card.nextDoseN_A": "Sonraki doz: Yok",
  "card.todayAt": "Bugün saat",
  "card.tomorrowAt": "Yarın saat",
  "card.at": "saat",
  "card.nextDose": "Sonraki doz:",
  "card.frequency.onceDaily": "Günde bir kez",
  "card.frequency.twiceDaily": "Günde iki kez",
  "card.frequency.thriceDaily": "Günde üç kez",
  "card.frequency.timesDaily": "Günde {count} kez",

  // Gerektiğinde diğer ayar anahtarlarını ekleyin
};
