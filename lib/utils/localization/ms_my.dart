// lib/utils/localization/ms_my.dart

const Map<String, String> msMY = {
  // General
  'general.appTitle': 'Peringatan Ubat',
  'general.save': 'Simpan',
  'general.cancel': 'Batal',
  'general.delete': 'Padam',
  'general.edit': 'Edit',
  'general.add': 'Tambah',
  'general.confirm': 'Sahkan',
  'general.success': 'Berjaya',
  'general.error': 'Ralat',
  'general.loading': 'Memuatkan...',
  'general.requiredField': 'Bidang ini diperlukan',
  'general.done': 'Selesai',

  // Auth
  'auth.login': 'Log Masuk',
  'auth.signup': 'Daftar',
  'auth.logout': 'Log Keluar',
  'auth.email': 'E-mel',
  'auth.password': 'Kata Laluan',
  'auth.loginButton': 'Log Masuk',
  'auth.signupButton': 'Daftar',
  'auth.loginErrorTitle': 'Log Masuk Gagal',
  'auth.signupErrorTitle': 'Pendaftaran Gagal',
  'auth.unknownError': 'Ralat yang tidak diketahui telah berlaku.',
  'auth.or': 'ATAU',
  'auth.noAccount': 'Tidak mempunyai akaun? Daftar',
  'auth.haveAccount': 'Sudah mempunyai akaun? Log masuk',
  'auth.checkEmail': 'Periksa e-mel anda',
  'auth.resetPasswordInfo':
      'Kami telah menghantar maklumat\n untuk menetapkan semula kata laluan anda',
  'auth.registerSuccessInfo':
      'Pendaftaran berjaya. Sila sahkan akaun anda\n dengan pautan yang dihantar ke alamat e-mel anda.',
  'auth.resetPassword': 'Tetapkan semula kata laluan',
  'auth.resetPasswordInstructions':
      'Masukkan alamat e-mel anda dan kami akan menghantar arahan lanjut tentang cara menetapkan semula kata laluan.',
  'auth.yourEmail': 'E-mel anda',
  'auth.resetButton': 'Tetapkan Semula Kata Laluan',
  'auth.emailRequired': 'Sila masukkan alamat e-mel anda.',

  // Home / Medicine List
  'home.title': 'Ubat Saya',
  'home.addMedicine': 'Tambah Ubat Baru',
  'home.noMedicines':
      'Belum ada ubat ditambahkan. Ketik + untuk menambah satu!',
  'home.confirmDeleteTitle': 'Padam Ubat',
  'home.confirmDeleteContent': 'Adakah anda pasti mahu memadam {medicineName}?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'Tambah Ubat',
  'addMedicine.titleEdit': 'Edit Ubat',
  'addMedicine.nameLabel': 'Nama Ubat',
  'addMedicine.nameHint': 'cth. Paracetamol',
  'addMedicine.typeLabel': 'Jenis/Kategori Ubat',
  'addMedicine.typeHint': 'cth. Pil, Sirap, Suntikan',
  'addMedicine.dosageLabel': 'Kuantiti Dos',
  'addMedicine.dosageHint': 'cth. 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'Unit Dos',
  'addMedicine.dosageUnitHint': 'cth. tablet, mL, mg',
  'addMedicine.frequencyLabel': 'Kekerapan',
  'addMedicine.frequencyHint': 'cth. Harian, Dua kali sehari',
  'addMedicine.durationLabel': 'Tempoh (hari)',
  'addMedicine.durationHint': 'cth. 7, 14, 30 (0 untuk berterusan)',
  'addMedicine.whenToTakeLabel': 'Bila Diambil / Nota',
  'addMedicine.whenToTakeHint': 'cth. Dengan makanan, Sebelum tidur',
  'addMedicine.startDateLabel': 'Tarikh Mula',
  'addMedicine.endDateLabel': 'Tarikh Tamat (Pilihan)',
  'addMedicine.selectDate': 'Pilih Tarikh',
  'addMedicine.selectTime': 'Pilih Masa',
  'addMedicine.timesLabel': 'Kali Sehari',
  'addMedicine.addTime': 'Tambah Masa',
  'addMedicine.notesLabel': 'Nota Tambahan (Pilihan)',
  'addMedicine.notesHint': 'cth. Simpan di tempat sejuk',
  'addMedicine.enableNotificationsLabel': 'Aktifkan Peringatan Dos',
  'addMedicine.errorNumeric': 'Sila masukkan nombor yang sah',
  'addMedicine.addMedicine': 'Tambah Ubat',
  'addMedicine.save': 'Simpan',
  'addMedicine.name': 'Nama Ubat',
  'addMedicine.addMedicineHint': 'Nama Ubat (cth. Paracetamol)',
  'addMedicine.dosage': 'Dos',
  'addMedicine.dosageHint2': 'Kuantiti (cth. 500)',
  'addMedicine.dosageUnit': 'Unit (cth. mg)',
  'addMedicine.category': 'Kategori',
  'addMedicine.frequency': 'Kekerapan & Tempoh',
  'addMedicine.selectDoseTimes': 'Pilih Masa Dos',
  'addMedicine.times': 'kali dipilih',
  'addMedicine.selectDuration': 'Pilih Tempoh',
  'addMedicine.days': 'hari',
  'addMedicine.whenToTake': 'Bila Diambil',
  'addMedicine.beforeFood': 'Sebelum Makan',
  'addMedicine.afterFood': 'Selepas Makan',
  'addMedicine.notifications': 'Notifikasi',
  'addMedicine.enableNotifications': 'Aktifkan Peringatan Dos',
  'addMedicine.receiveNotification':
      'Terima notifikasi 5 minit sebelum setiap dos',
  'addMedicine.doseTimesPickerTitle': 'Pilih Masa Dos',
  'addMedicine.done': 'Selesai',
  'addMedicine.deleteMedicine': 'Padam Ubat',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Ubat berjaya ditambahkan.',
  'medicine.updateSuccess': 'Ubat berjaya dikemas kini.',
  'medicine.deleteSuccess': 'Ubat berjaya dipadam.',
  'medicine.errorNeedTime': 'Sila pilih sekurang-kurangnya satu masa.',
  'medicine.saveMedicineSuccess': 'Ubat berjaya disimpan.',
  'medicine.saveMedicineError': 'Ralat',
  'medicine.saveMedicineErrorMessage': 'Gagal menyimpan ubat: {e}',
  'medicine.updateMedicineSuccess': 'Ubat berjaya dikemas kini.',
  'medicine.updateMedicineError': 'Ralat',
  'medicine.updateMedicineErrorMessage': 'Gagal mengemas kini ubat: {e}',
  'medicine.deleteMedicineSuccess': 'Ubat berjaya dipadam.',
  'medicine.deleteMedicineError': 'Ralat',
  'medicine.deleteMedicineErrorMessage': 'Gagal memadam ubat: {e}',
  'medicine.deleteMedicineSuccessMessage': 'Ubat berjaya dipadam.',
  'medicine.saveMedicineSuccessMessage': 'Ubat berjaya disimpan.',
  'medicine.withFood': 'Dengan Makanan',

  // Settings Page
  'settings.title': 'Tetapan',
  'settings.language': 'Bahasa',
  'settings.selectLanguage': 'Pilih Bahasa',
  'settings.profile': 'Profil',

  // Introduction Screen
  'introduction.skip': 'Langkau',
  'introduction.done': 'Selesai',
  'introduction.next': 'Seterusnya',

  // Filter
  'filter.allTypes': 'Semua Jenis',
  'filter.uncategorized': 'Tidak Dikategorikan',
  'filter.searchHint': 'Cari Ubat...',
  'filter.noResultsForSearchAndType':
      'Tiada hasil untuk "{query}" dalam {type}',
  'filter.noResultsForSearch': 'Tiada hasil untuk "{query}"',
  'filter.noResultsForType': 'Tiada hasil untuk jenis "{type}"',

  // Medicine Card
  'card.treatmentCompleted': 'Rawatan Selesai',
  'card.nextDoseN_A': 'Dos seterusnya: T/A',
  'card.todayAt': 'Hari ini pada',
  'card.tomorrowAt': 'Esok pada',
  'card.at': 'pada',
  'card.nextDose': 'Dos seterusnya:',
  'card.frequency.onceDaily': 'Sekali sehari',
  'card.frequency.twiceDaily': 'Dua kali sehari',
  'card.frequency.thriceDaily': 'Tiga kali sehari',
  'card.frequency.timesDaily': '{count} kali sehari',
  'addMedicine.nameLabelText': 'Nama',
  'addMedicine.dosageLabelText': 'Dos',
  'addMedicine.dosageQuantityHint': 'Kuantiti (cth. 500)',
  'addMedicine.categoryLabel': 'Kategori',
  'addMedicine.frequencyDurationLabel': 'Kekerapan & Tempoh',
  'addMedicine.selectDoseTimesPlaceholder': 'Pilih Masa Dos',
  'addMedicine.doseTimesBottomSheetTitle': 'Pilih Masa Dos',
  'addMedicine.timesSelectedInfo': '{count} masa dipilih',
  'addMedicine.selectDurationPlaceholder': 'Pilih Tempoh',
  'addMedicine.durationSelectedInfo': '{count} hari',
  'addMedicine.whenToTakeLabelText': 'Bila Diambil',
  'addMedicine.beforeFoodOption': 'Sebelum Makan',
  'addMedicine.afterFoodOption': 'Selepas Makan',
  'addMedicine.notificationsSectionLabel': 'Notifikasi',
  'addMedicine.notificationSubtext':
      'Terima notifikasi 5 minit sebelum setiap dos',
  'addMedicine.durationPickerTitle': 'Pilih Tempoh (dalam hari)',
  'addMedicine.durationPickerItemText': '{days} hari',
  'addMedicine.timesSelected': 'kali dipilih',
  'addMedicine.notificationsLabel': 'Notifikasi',
  'addMedicine.enableDoseReminders': 'Aktifkan Peringatan Dos',
  'addMedicine.remindersSubtext':
      'Terima notifikasi 5 minit sebelum setiap dos',

  // Profile Page
  'personal_info': 'Maklumat Peribadi',
  'preferences': 'Keutamaan',
  'about_app': 'Tentang Aplikasi',
  'app_version': 'Versi Aplikasi',
  'privacy_policy': 'Dasar Privasi',
  'developer': 'Pembangun: Furkan Akif ISLEK',
  'noEmail': 'Tiada e-mel dijumpai',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'Padam Akaun',
  'profile.deleteAccountImportantText':
      'Adakah anda pasti mahu memadam akaun anda? Tindakan ini tidak dapat dibatalkan.',
  'profile.cancel': 'Batal',
  'profile.delete': 'Padam',
  'profile.errorDeletingAccount': 'Ralat memadam akaun',
  'profile.deleteAccountButton': 'Padam Akaun',

  // Profile Page
  'logout': 'Log Keluar',
  'account': 'Akaun',

  // Blog Page
  'Blog': 'Blog',
  'Bir hata oluştu.': 'Ralat telah berlaku.',
  'Blog yazısı bulunamadı.': 'Tiada catatan blog ditemui.',
  'Şuan blog yok': 'Tiada blog tersedia',
  'pills': 'Pil',
  'health': 'Kesihatan',
  'lifeStyle': 'Gaya Hidup',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>Peringatan Ubat - Dasar Privasi</h3><br><p><b>Penggunaan Maklumat Peribadi:</b><br>Aplikasi kami komited untuk melindungi privasi pengguna kami. Dalam aplikasi peringatan ubat kami, kami mengumpulkan maklumat yang diperlukan (e-mel, maklumat profil, dan pelan pengambilan ubat) untuk penjejakan ubat dan peringatan. Maklumat ini digunakan untuk menyediakan dan meningkatkan perkhidmatan kami dan tidak dikongsi dengan pihak ketiga.</p><br><p><b>Penyimpanan Data dan Keselamatan:</b><br>Data pengguna anda disimpan di pelayan yang selamat dalam format yang terenkripsi. Maklumat ubat dan data peribadi anda dilindungi di bawah langkah-langkah keselamatan yang kuat. Hanya kakitangan yang diperlukan sahaja yang boleh mengakses data anda.</p><br><p><b>Hak Pengguna:</b><br>Pengguna mempunyai hak untuk melihat, mengedit, atau menghapus akaun dan data mereka pada bila-bila masa. Apabila anda menghapus akaun anda, semua data anda akan dibuang secara kekal dari sistem kami.</p><br><p><b>Kuki dan Penjejakan:</b><br>Aplikasi kami mungkin menggunakan kuki untuk meningkatkan pengalaman pengguna. Kuki ini menyimpan pilihan pengguna dan data penggunaan aplikasi. Anda boleh menyahaktifkan kuki daripada tetapan pelayar anda jika anda mahu.</p><br><p><b>Pemberitahuan:</b><br>Aplikasi kami hanya menghantar pemberitahuan untuk peringatan ubat yang diluluskan oleh pengguna. Anda tidak akan menerima pemberitahuan yang tidak diingini dan boleh menyahaktifkan pemberitahuan dari bahagian tetapan.</p><br><p><b>Perubahan:</b><br>Dasar privasi kami mungkin dikemas kini dari semasa ke semasa. Pengguna akan dimaklumkan apabila terdapat perubahan yang ketara. Dengan menggunakan aplikasi kami, anda bersetuju dengan syarat-syarat ini.</p><br><p><b>Hubungi:</b><br>Sila hubungi kami dengan sebarang pertanyaan mengenai dasar privasi kami.</p>',

  // Introduction Page
  "introduction.page1.title":
      "Ambil Ubat Anda Tepat Pada Masanya, Jaga Kesihatan Anda",
  "introduction.page1.description":
      "Mudah untuk lupa masa pengambilan ubat dalam kesibukan kehidupan. Dengan aplikasi kami, anda tidak akan terlepas mana-mana dos lagi. Tetapkan ubat, masa, dan tempoh anda – kami akan mengingatkan anda tepat pada masanya.",
  "introduction.page1.tip":
      "Kesihatan bermula dengan satu dos penjagaan yang diambil tepat pada masanya.",

  "introduction.page2.title": "Jejaki Kesihatan Anda, Dapatkan Informasi",
  "introduction.page2.description":
      "Kami bukan sahaja mengingatkan anda tetapi juga memberikan maklumat berguna tentang kesihatan anda. Perkuatkan tabiat kesihatan harian anda dengan artikel blog yang disokong pakar.",
  "introduction.page2.tip":
      "Sepotong kecil maklumat boleh membuat perbezaan besar.",

  "introduction.page3.title":
      "Terbuka kepada Dunia, Dipersonalisasikan untuk Anda",
  "introduction.page3.description":
      "Aplikasi kami boleh diakses oleh semua orang dengan sokongan untuk 16 bahasa. Dengan antaramuka yang mudah digunakan, tambahkan ubat anda dengan hanya beberapa ketukan dan buat hidup anda lebih mudah.",
  "introduction.page3.tip": "Kesihatan adalah universal, begitu juga kami.",

  "introduction.back": "Kembali",
  "introduction.start": "Mula",

  // Register Page
  "register.register_to_medreminder_app": "Daftar ke aplikasi Amina Dose",
  "register.already_have_an_account": "Sudah mempunyai akaun? ",
  "register.sign_in": "Log masuk",
  "register.full_name": "Nama penuh anda",
  "register.surname": "Nama keluarga anda",
  "register.your_email": "E-mel anda",
  "register.type_your_password": "Taip kata laluan anda",
  "register.re_type_your_password": "Taip semula kata laluan anda",
  "register.register": "Daftar",
  "register.fill_all_fields": "Sila isi semua ruangan",
  "register.password_not_match": "Kata laluan tidak sepadan",
  "register.error_occurred": "Ralat telah berlaku",

  // Login Page
  "login.invalid_email": "Alamat e-mel tidak sah",
  "login.user_disabled": "Pengguna telah dinyahaktifkan",
  "login.email_already_in_use": "Alamat e-mel ini sudah digunakan",
  "login.wrong_password": "Maklumat yang anda masukkan tidak betul",
  "login.email_not_verified": "Sila sahkan alamat e-mel anda terlebih dahulu",
  "login.operation_not_allowed": "Operasi ini tidak dibenarkan",
  "login.error_occurred": "Ralat telah berlaku",
  "login.error_occured_google": "Ralat berlaku semasa log masuk dengan Google",
  "login.please_enter_your_email": "Sila masukkan alamat e-mel anda",
  "login.password_reset_email_sent":
      "E-mel tetapan semula kata laluan telah dihantar",
  "login.login_into_your_account": "Log masuk ke akaun anda",
  "login.dont_have_an_account": "Tidak mempunyai akaun? ",
  "login.sign_up": "Daftar",
  "login.your_email": "E-mel anda",
  "login.type_your_password": "Taip kata laluan anda",
  "login.login": "Log masuk",
  "login.forgot_password": "Lupa kata laluan?",
  "login.or": "atau",
  "login.login_with_google": "Log masuk dengan Google",

  // Menu Page
  "menu.myMedicines": "Ubat Saya",
  "menu.addMedicine": "Tambah Ubat",
  "menu.blogs": "Blog",
  "menu.profile": "Profil",

  'time_for_medicine': 'Masa untuk ubat anda!',
  'take_medicine_now': 'Ambil {dosageInfo} {medicineName} anda sekarang.',
};
