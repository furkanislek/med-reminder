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
  "addMedicine.timesLabel": "Günlük Doz Sayısı",
  "addMedicine.addTime": "Saat Ekle",
  "addMedicine.notesLabel": "Ek Notlar (İsteğe bağlı)",
  "addMedicine.notesHint": "Örn: Serin yerde saklayın",
  "addMedicine.enableNotificationsLabel": "Doz Hatırlatıcılarını Etkinleştir",
  "addMedicine.errorNumeric": "Lütfen geçerli bir sayı girin",
  "addMedicine.addMedicine": "İlaç Ekle",
  "addMedicine.save": "Kaydet",
  "addMedicine.name": "İlaç Adı",
  "addMedicine.addMedicineHint": "İlaç Adı (Örn: Parasetamol)",
  "addMedicine.dosage": "Doz",
  "addMedicine.dosageHint2": "Miktar (Örn: 500)",
  "addMedicine.dosageUnit": "Birim (Örn: mg)",
  "addMedicine.category": "Kategori",
  "addMedicine.frequency": "Sıklık & Süre",
  "addMedicine.selectDoseTimes": "Saat Seç",
  "addMedicine.times": "Defa Seçildi",
  "addMedicine.selectDuration": "Süre Seç",
  "addMedicine.days": "Gün",
  "addMedicine.whenToTake": "Alınma Zamanı",
  "addMedicine.beforeFood": "Yemekten Önce",
  "addMedicine.afterFood": "Yemekten Sonra",
  "addMedicine.notifications": "Hatırlatıcılar",
  "addMedicine.enableNotifications": "Doz Hatırlatıcılarını Etkinleştir",
  "addMedicine.receiveNotification": "Her doz için 5 dakika önce bildirim alın",
  "addMedicine.timesSelected": "Defa Seçildi",
  "addMedicine.notificationsLabel": "Hatırlatıcılar",
  "addMedicine.enableDoseReminders": "Doz Hatırlatıcılarını Etkinleştir",
  "addMedicine.remindersSubtext": "Her doz için 5 dakika önce bildirim alın",
  'addMedicine.frequencyDurationLabel': 'Sıklık & Süre',
  'addMedicine.selectDoseTimesPlaceholder': 'Saat Seç',
  'addMedicine.doseTimesBottomSheetTitle': 'Saat Seç',
  'addMedicine.timesSelectedInfo': '{count} defa seçildi',
  'addMedicine.selectDurationPlaceholder': 'Süre Seç',
  'addMedicine.durationSelectedInfo': '{count} gün',
  'addMedicine.whenToTakeLabelText': 'Alınma Zamanı',
  'addMedicine.doseTimesPickerTitle': 'Saat Seç',
  'addMedicine.done': 'Tamam',

  // Medicine Controller Messages
  "medicine.addSuccess": "İlaç başarıyla eklendi.",
  "medicine.updateSuccess": "İlaç başarıyla güncellendi.",
  "medicine.deleteSuccess": "İlaç başarıyla silindi.",
  "medicine.errorNeedTime": "Lütfen en az bir saat seçin.",
  "medicine.saveMedicineSuccess": "İlaç başarıyla kaydedildi.",
  "medicine.saveMedicineError": "Hata",
  "medicine.saveMedicineErrorMessage": "İlaç kaydedilirken hata: {e}",
  "medicine.updateMedicineSuccess": "İlaç başarıyla güncellendi.",
  "medicine.updateMedicineError": "Hata",
  "medicine.updateMedicineErrorMessage": "İlaç güncellenirken hata: {e}",
  "medicine.deleteMedicineSuccess": "İlaç başarıyla silindi.",
  "medicine.deleteMedicineError": "Hata",
  "medicine.deleteMedicineErrorMessage": "İlaç silinirken hata: {e}",
  "medicine.withFood": "Yemekle Beraber",
  "medicine.deleteMedicineSuccessMessage": "İlaç başarıyla silindi.",
  "medicine.saveMedicineSuccessMessage": "İlaç başarıyla kaydedildi.",

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

  // Profil Sayfası
  "personal_info": "Kişisel Bilgiler",
  "preferences": "Tercihler",
  "about_app": "Uygulama Hakkında",
  "app_version": "Uygulama Versiyonu",
  "privacy_policy": "Gizlilik Politikası",
  "developer": "Geliştirici: Furkan Akif İŞLEK",
  "noEmail": "E-posta bulunamadı",
  "version.number": "1.0.0",
  "profile.deleteAccountImportant": "Hesabı Sil",
  "profile.deleteAccountImportantText":
      "Hesabınızı silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.",
  "profile.cancel": "İptal",
  "profile.delete": "Sil",
  "profile.errorDeletingAccount": "Hesap silinirken bir hata oluştu",
  "profile.deleteAccountButton": "Hesabı Sil",
  // Profile Page
  "logout": "Çıkış Yap",
  "account": "Hesap",
  "general.done": "Tamam",
  "addMedicine.durationPickerTitle": "Süre Seç",
  "addMedicine.durationPickerItemText": "{count} gün",

  // Blog Page
  "Blog": "Blog",
  "Bir hata oluştu.": "Bir hata oluştu.",
  "Blog yazısı bulunamadı.": "Blog yazısı bulunamadı.",
  "Şuan blog yok": "Şuan blog yok",
  "pills": "İlaçlar",
  "health": "Sağlık",
  "lifeStyle": "Yaşam Tarzı",

  // Privacy Policy
  "privacy_policy_content":
      "<h3>İlaç Hatırlatıcı - Gizlilik Politikası</h3><br><p><b>Kişisel Verilerinizin Kullanımı:</b><br>Uygulamamamız, kullanıcılarımızın gizliliğini korumayı taahhüt eder. İlaç hatırlatıcı uygulamamızda, kullanıcıların ilaç takibi ve hatırlatmalar için gerekli bilgileri (e-posta, profil bilgileri ve ilaç planları) toplanmaktadır. Bu bilgiler, hizmetimizi sağlamak ve geliştirmek için kullanılır ve üçüncü taraflarla paylaşılmaz.</p><br><p><b>Veri Saklama ve Güvenlik:</b><br>Kullanıcı verileriniz güvenli sunucularda ve şifrelenmiş formatta saklanır. İlaç bilgileriniz ve kişisel verileriniz, güçlü güvenlik önlemleri altında korunur. Verilerinize yalnızca gerekli personel erişebilir.</p><br><p><b>Kullanıcı Hakları:</b><br>Kullanıcılar, hesaplarını ve verilerini dilediği zaman görüntüleme, düzenleme veya silme hakkına sahiptir. Hesabınızı sildiğinizde, tüm verileriniz kalıcı olarak sistemimizden kaldırılır.</p><br><p><b>Çerezler ve Takip:</b><br>Uygulamamız, kullanıcı deneyimini geliştirmek için çerezler kullanabilir. Bu çerezler, kullanıcı tercihlerini ve uygulama kullanım verilerini saklar. İsterseniz tarayıcı ayarlarınızdan çerezleri devre dışı bırakabilirsiniz.</p><br><p><b>Bildirimler:</b><br>Uygulamamamız, yalnızca kullanıcının onayladığı ilaç hatırlatmaları için bildirimler gönderir. İstenmeyen bildirimler alınmaz ve bildirimleri ayarlar bölümünden devre dışı bırakabilirsiniz.</p><br><p><b>Değişiklikler:</b><br>Gizlilik politikamız zaman zaman güncellenebilir. Önemli değişiklikler olduğunda kullanıcılarımıza bildirim yapılacaktır. Uygulamamamızı kullanarak, bu şartları kabul etmiş olursunuz.</p><br><p><b>İletişim:</b><br>Gizlilik politikamızla ilgili sorularınız için lütfen bize ulaşın.</p>",
};
