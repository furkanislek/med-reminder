// lib/utils/localization/hi_in.dart

const Map<String, String> hiIN = {
  // General
  'general.appTitle': 'दवा रिमाइंडर',
  'general.save': 'सहेजें',
  'general.cancel': 'रद्द करें',
  'general.delete': 'हटाएं',
  'general.edit': 'संपादित करें',
  'general.add': 'जोड़ें',
  'general.confirm': 'पुष्टि करें',
  'general.success': 'सफलता',
  'general.error': 'त्रुटि',
  'general.loading': 'लोड हो रहा है...',
  'general.requiredField': 'यह फ़ील्ड आवश्यक है',
  'general.done': 'पूर्ण',

  // Auth
  'auth.login': 'लॉगिन',
  'auth.signup': 'साइन अप',
  'auth.logout': 'लॉगआउट',
  'auth.email': 'ईमेल',
  'auth.password': 'पासवर्ड',
  'auth.loginButton': 'लॉगिन करें',
  'auth.signupButton': 'साइन अप करें',
  'auth.loginErrorTitle': 'लॉगिन विफल',
  'auth.signupErrorTitle': 'साइन अप विफल',
  'auth.unknownError': 'एक अज्ञात त्रुटि हुई।',
  'auth.or': 'या',
  'auth.noAccount': 'खाता नहीं है? साइन अप करें',
  'auth.haveAccount': 'पहले से ही खाता है? लॉगिन करें',
  'auth.checkEmail': 'अपना ईमेल जांचें',
  'auth.resetPasswordInfo':
      'हमने आपको आपका पासवर्ड रीसेट करने के लिए\n जानकारी भेज दी है',
  'auth.registerSuccessInfo':
      'पंजीकरण सफल। कृपया अपने ईमेल पते पर भेजे गए लिंक से\n अपने खाते की पुष्टि करें।',
  'auth.resetPassword': 'पासवर्ड रीसेट करें',
  'auth.resetPasswordInstructions':
      'अपना ईमेल पता दर्ज करें और हम आपको पासवर्ड रीसेट करने के लिए आगे के निर्देश भेजेंगे।',
  'auth.yourEmail': 'आपका ईमेल',
  'auth.resetButton': 'पासवर्ड रीसेट करें',
  'auth.emailRequired': 'कृपया अपना ईमेल पता दर्ज करें।',

  // Home / Medicine List
  'home.title': 'मेरी दवाइयां',
  'home.addMedicine': 'नई दवा जोड़ें',
  'home.noMedicines':
      'अभी तक कोई दवा नहीं जोड़ी गई। एक जोड़ने के लिए + पर टैप करें!',
  'home.confirmDeleteTitle': 'दवा हटाएं',
  'home.confirmDeleteContent':
      'क्या आप वाकई {medicineName} को हटाना चाहते हैं?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'दवा जोड़ें',
  'addMedicine.titleEdit': 'दवा संपादित करें',
  'addMedicine.nameLabel': 'दवा का नाम',
  'addMedicine.nameHint': 'उदा. पैरासिटामोल',
  'addMedicine.typeLabel': 'दवा का प्रकार/श्रेणी',
  'addMedicine.typeHint': 'उदा. गोली, सिरप, इंजेक्शन',
  'addMedicine.dosageLabel': 'खुराक मात्रा',
  'addMedicine.dosageHint': 'उदा. 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'खुराक इकाई',
  'addMedicine.dosageUnitHint': 'उदा. टैबलेट, मिलीलीटर, मिलीग्राम',
  'addMedicine.frequencyLabel': 'आवृत्ति',
  'addMedicine.frequencyHint': 'उदा. दैनिक, दिन में दो बार',
  'addMedicine.durationLabel': 'अवधि (दिन)',
  'addMedicine.durationHint': 'उदा. 7, 14, 30 (निरंतर के लिए 0)',
  'addMedicine.whenToTakeLabel': 'कब लेना है / नोट्स',
  'addMedicine.whenToTakeHint': 'उदा. भोजन के साथ, सोने से पहले',
  'addMedicine.startDateLabel': 'आरंभ तिथि',
  'addMedicine.endDateLabel': 'समाप्ति तिथि (वैकल्पिक)',
  'addMedicine.selectDate': 'तिथि चुनें',
  'addMedicine.selectTime': 'समय चुनें',
  'addMedicine.timesLabel': 'प्रति दिन बार',
  'addMedicine.addTime': 'समय जोड़ें',
  'addMedicine.notesLabel': 'अतिरिक्त नोट्स (वैकल्पिक)',
  'addMedicine.notesHint': 'उदा. ठंडी जगह पर रखें',
  'addMedicine.enableNotificationsLabel': 'खुराक अनुस्मारक सक्षम करें',
  'addMedicine.errorNumeric': 'कृपया एक वैध संख्या दर्ज करें',
  'addMedicine.addMedicine': 'दवा जोड़ें',
  'addMedicine.save': 'सहेजें',
  'addMedicine.name': 'दवा का नाम',
  'addMedicine.addMedicineHint': 'दवा का नाम (उदा. पैरासिटामोल)',
  'addMedicine.dosage': 'खुराक',
  'addMedicine.dosageHint2': 'मात्रा (उदा. 500)',
  'addMedicine.dosageUnit': 'इकाई (उदा. मिलीग्राम)',
  'addMedicine.category': 'श्रेणी',
  'addMedicine.frequency': 'आवृत्ति और अवधि',
  'addMedicine.selectDoseTimes': 'खुराक समय चुनें',
  'addMedicine.times': 'बार चयनित',
  'addMedicine.selectDuration': 'अवधि चुनें',
  'addMedicine.days': 'दिन',
  'addMedicine.whenToTake': 'कब लेना है',
  'addMedicine.beforeFood': 'भोजन से पहले',
  'addMedicine.afterFood': 'भोजन के बाद',
  'addMedicine.notifications': 'सूचनाएँ',
  'addMedicine.enableNotifications': 'खुराक अनुस्मारक सक्षम करें',
  'addMedicine.receiveNotification':
      'प्रत्येक खुराक से 5 मिनट पहले एक सूचना प्राप्त करें',
  'addMedicine.doseTimesPickerTitle': 'खुराक समय चुनें',
  'addMedicine.done': 'पूर्ण',
  'addMedicine.deleteMedicine': 'दवा हटाएं',

  // Medicine Controller Messages
  'medicine.addSuccess': 'दवा सफलतापूर्वक जोड़ी गई।',
  'medicine.updateSuccess': 'दवा सफलतापूर्वक अपडेट की गई।',
  'medicine.deleteSuccess': 'दवा सफलतापूर्वक हटा दी गई।',
  'medicine.errorNeedTime': 'कृपया कम से कम एक समय चुनें।',
  'medicine.saveMedicineSuccess': 'दवा सफलतापूर्वक सहेजी गई।',
  'medicine.saveMedicineError': 'त्रुटि',
  'medicine.saveMedicineErrorMessage': 'दवा सहेजने में विफल: {e}',
  'medicine.updateMedicineSuccess': 'दवा सफलतापूर्वक अपडेट की गई।',
  'medicine.updateMedicineError': 'त्रुटि',
  'medicine.updateMedicineErrorMessage': 'दवा अपडेट करने में विफल: {e}',
  'medicine.deleteMedicineSuccess': 'दवा सफलतापूर्वक हटा दी गई।',
  'medicine.deleteMedicineError': 'त्रुटि',
  'medicine.deleteMedicineErrorMessage': 'दवा हटाने में विफल: {e}',
  'medicine.withFood': 'भोजन के साथ',
  'medicine.deleteMedicineSuccessMessage': 'दवा सफलतापूर्वक हटाई गई।',
  'medicine.saveMedicineSuccessMessage': 'दवा सफलतापूर्वक सहेजी गई।',

  // Settings Page
  'settings.title': 'सेटिंग्स',
  'settings.language': 'भाषा',
  'settings.selectLanguage': 'भाषा चुनें',
  'settings.profile': 'प्रोफ़ाइल',

  // Introduction Screen
  'introduction.skip': 'छोड़ें',
  'introduction.done': 'पूर्ण',
  'introduction.next': 'अगला',

  // Filter
  'filter.allTypes': 'सभी प्रकार',
  'filter.uncategorized': 'अवर्गीकृत',
  'filter.searchHint': 'दवाइयां खोजें...',
  'filter.noResultsForSearchAndType':
      '{type} में "{query}" के लिए कोई परिणाम नहीं',
  'filter.noResultsForSearch': '"{query}" के लिए कोई परिणाम नहीं',
  'filter.noResultsForType': 'प्रकार "{type}" के लिए कोई परिणाम नहीं',

  // Medicine Card
  'card.treatmentCompleted': 'उपचार पूरा हुआ',
  'card.nextDoseN_A': 'अगली खुराक: N/A',
  'card.todayAt': 'आज',
  'card.tomorrowAt': 'कल',
  'card.at': 'बजे',
  'card.nextDose': 'अगली खुराक:',
  'card.frequency.onceDaily': 'दिन में एक बार',
  'card.frequency.twiceDaily': 'दिन में दो बार',
  'card.frequency.thriceDaily': 'दिन में तीन बार',
  'card.frequency.timesDaily': 'दिन में {count} बार',
  'addMedicine.nameLabelText': 'नाम',
  'addMedicine.dosageLabelText': 'खुराक',
  'addMedicine.dosageQuantityHint': 'मात्रा (उदा. 500)',
  'addMedicine.categoryLabel': 'श्रेणी',
  'addMedicine.frequencyDurationLabel': 'आवृत्ति और अवधि',
  'addMedicine.selectDoseTimesPlaceholder': 'खुराक समय चुनें',
  'addMedicine.doseTimesBottomSheetTitle': 'खुराक समय चुनें',
  'addMedicine.timesSelectedInfo': '{count} समय चयनित',
  'addMedicine.selectDurationPlaceholder': 'अवधि चुनें',
  'addMedicine.durationSelectedInfo': '{count} दिन',
  'addMedicine.whenToTakeLabelText': 'कब लेना है',
  'addMedicine.beforeFoodOption': 'भोजन से पहले',
  'addMedicine.afterFoodOption': 'भोजन के बाद',
  'addMedicine.notificationsSectionLabel': 'सूचनाएँ',
  'addMedicine.notificationSubtext':
      'प्रत्येक खुराक से 5 मिनट पहले एक सूचना प्राप्त करें',
  'addMedicine.durationPickerTitle': 'अवधि चुनें (दिनों में)',
  'addMedicine.durationPickerItemText': '{days} दिन',
  'addMedicine.timesSelected': 'बार चयनित',
  'addMedicine.notificationsLabel': 'सूचनाएँ',
  'addMedicine.enableDoseReminders': 'खुराक अनुस्मारक सक्षम करें',
  'addMedicine.remindersSubtext':
      'प्रत्येक खुराक से 5 मिनट पहले एक सूचना प्राप्त करें',

  // Profile Page
  'personal_info': 'व्यक्तिगत जानकारी',
  'preferences': 'प्राथमिकताएँ',
  'about_app': 'ऐप के बारे में',
  'app_version': 'ऐप संस्करण',
  'privacy_policy': 'गोपनीयता नीति',
  'developer': 'डेवलपर: फ़ुरकान अकीफ़ इस्लेक',
  'noEmail': 'कोई ईमेल नहीं मिला',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'खाता हटाएं',
  'profile.deleteAccountImportantText':
      'क्या आप वाकई अपना खाता हटाना चाहते हैं? यह क्रिया पूर्ववत नहीं की जा सकती।',
  'profile.cancel': 'रद्द करें',
  'profile.delete': 'हटाएं',
  'profile.errorDeletingAccount': 'खाता हटाने में त्रुटि',
  'profile.deleteAccountButton': 'खाता हटाएं',

  // Profile Page
  'logout': 'लॉगआउट',
  'account': 'खाता',

  // Blog Page
  'Blog': 'ब्लॉग',
  'Bir hata oluştu.': 'एक त्रुटि हुई।',
  'Blog yazısı bulunamadı.': 'कोई ब्लॉग पोस्ट नहीं मिली।',
  'Şuan blog yok': 'कोई ब्लॉग उपलब्ध नहीं है',
  'pills': 'गोलियाँ',
  'health': 'स्वास्थ्य',
  'lifeStyle': 'जीवन शैली',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>दवा रिमाइंडर - गोपनीयता नीति</h3><br><p><b>व्यक्तिगत जानकारी का उपयोग:</b><br>हमारा एप्लिकेशन हमारे उपयोगकर्ताओं की गोपनीयता की रक्षा करने के लिए प्रतिबद्ध है। हमारे दवा रिमाइंडर ऐप में, हम दवाओं के ट्रैकिंग और रिमाइंडर के लिए आवश्यक जानकारी (ईमेल, प्रोफाइल जानकारी और दवा प्लान) एकत्र करते हैं। इस जानकारी का उपयोग हमारी सेवा प्रदान करने और सुधारने के लिए किया जाता है और यह किसी तीसरे पक्ष के साथ साझा नहीं की जाती है।</p><br><p><b>डेटा स्टोरेज और सुरक्षा:</b><br>आपका उपयोगकर्ता डेटा एन्क्रिप्टेड प्रारूप में सुरक्षित सर्वर पर संग्रहीत किया जाता है। आपकी दवा जानकारी और व्यक्तिगत डेटा मजबूत सुरक्षा उपायों के तहत संरक्षित हैं। केवल आवश्यक कर्मचारी ही आपके डेटा तक पहुंच सकते हैं।</p><br><p><b>उपयोगकर्ता अधिकार:</b><br>उपयोगकर्ताओं को किसी भी समय अपने खाते और डेटा को देखने, संपादित करने या हटाने का अधिकार है। जब आप अपना खाता हटाते हैं, तो आपका सभी डेटा हमारे सिस्टम से स्थायी रूप से हटा दिया जाता है।</p><br><p><b>कुकीज़ और ट्रैकिंग:</b><br>हमारा एप्लिकेशन उपयोगकर्ता अनुभव को बेहतर बनाने के लिए कुकीज़ का उपयोग कर सकता है। ये कुकीज़ उपयोगकर्ता प्राथमिकताओं और एप्लिकेशन उपयोग डेटा को स्टोर करती हैं। यदि आप चाहें तो अपने ब्राउज़र सेटिंग्स से कुकीज़ को अक्षम कर सकते हैं।</p><br><p><b>नोटिफिकेशन:</b><br>हमारा एप्लिकेशन केवल उपयोगकर्ता द्वारा अनुमोदित दवा रिमाइंडर के लिए नोटिफिकेशन भेजता है। आपको अवांछित नोटिफिकेशन प्राप्त नहीं होंगे और आप सेटिंग्स अनुभाग से नोटिफिकेशन को अक्षम कर सकते हैं।</p><br><p><b>परिवर्तन:</b><br>हमारी गोपनीयता नीति समय-समय पर अपडेट की जा सकती है। जब महत्वपूर्ण परिवर्तन होते हैं तो उपयोगकर्ताओं को सूचित किया जाएगा। हमारे एप्लिकेशन का उपयोग करके, आप इन शर्तों से सहमत होते हैं।</p><br><p><b>संपर्क:</b><br>हमारी गोपनीयता नीति के बारे में किसी भी प्रश्न के लिए कृपया हमसे संपर्क करें।</p>',

  // Introduction Page
  "introduction.page1.title":
      "अपनी दवा समय पर लें, अपने स्वास्थ्य को सुरक्षित रखें",
  "introduction.page1.description":
      "जीवन की व्यस्तता में दवा लेने का समय भूलना आसान है। हमारे ऐप के साथ, आप अब कोई भी खुराक नहीं चूकेंगे। अपनी दवा, समय और अवधि सेट करें – हम आपको समय पर याद दिलाएंगे।",
  "introduction.page1.tip":
      "स्वास्थ्य की शुरुआत समय पर ली गई देखभाल की एक खुराक से होती है।",

  "introduction.page2.title":
      "अपने स्वास्थ्य पर नज़र रखें, जानकारी प्राप्त करें",
  "introduction.page2.description":
      "हम आपको केवल याद ही नहीं दिलाते, बल्कि आपके स्वास्थ्य के बारे में उपयोगी जानकारी भी प्रदान करते हैं। विशेषज्ञ समर्थित ब्लॉग पोस्ट के साथ अपनी दैनिक स्वास्थ्य आदतों को मजबूत करें।",
  "introduction.page2.tip": "छोटी सी जानकारी बड़ा बदलाव ला सकती है।",

  "introduction.page3.title": "दुनिया के लिए खुला, आपके लिए व्यक्तिगत",
  "introduction.page3.description":
      "हमारा ऐप 16 भाषाओं के समर्थन के साथ सभी के लिए सुलभ है। इसके उपयोग में आसान इंटरफेस के साथ, बस कुछ टैप से अपनी दवा जोड़ें और अपना जीवन आसान बनाएं।",
  "introduction.page3.tip": "स्वास्थ्य सार्वभौमिक है, और हम भी हैं।",

  "introduction.back": "पीछे",
  "introduction.start": "शुरू करें",

  // Register Page
  "register.register_to_medreminder_app": "मेडरिमाइंडर ऐप में पंजीकरण करें",
  "register.already_have_an_account": "पहले से ही खाता है? ",
  "register.sign_in": "लॉगिन करें",
  "register.full_name": "आपका पूरा नाम",
  "register.surname": "आपका उपनाम",
  "register.your_email": "आपका ईमेल",
  "register.type_your_password": "अपना पासवर्ड लिखें",
  "register.re_type_your_password": "अपना पासवर्ड फिर से लिखें",
  "register.register": "पंजीकरण करें",
  "register.fill_all_fields": "कृपया सभी क्षेत्रों को भरें",
  "register.password_not_match": "पासवर्ड मेल नहीं खाते",
  "register.error_occurred": "एक त्रुटि हुई",

  // Login Page
  "login.invalid_email": "अमान्य ईमेल पता",
  "login.user_disabled": "उपयोगकर्ता अक्षम कर दिया गया है",
  "login.email_already_in_use": "यह ईमेल पता पहले से ही उपयोग में है",
  "login.wrong_password": "आपके द्वारा दर्ज की गई जानकारी गलत है",
  "login.email_not_verified": "कृपया पहले अपने ईमेल पते की पुष्टि करें",
  "login.operation_not_allowed": "यह ऑपरेशन अनुमति नहीं है",
  "login.error_occurred": "एक त्रुटि हुई",
  "login.error_occured_google": "Google के साथ साइन इन करते समय एक त्रुटि हुई",
  "login.please_enter_your_email": "कृपया अपना ईमेल पता दर्ज करें",
  "login.password_reset_email_sent": "पासवर्ड रीसेट ईमेल भेज दिया गया",
  "login.login_into_your_account": "अपने खाते में लॉगिन करें",
  "login.dont_have_an_account": "खाता नहीं है? ",
  "login.sign_up": "पंजीकरण करें",
  "login.your_email": "आपका ईमेल",
  "login.type_your_password": "अपना पासवर्ड लिखें",
  "login.login": "लॉगिन करें",
  "login.forgot_password": "अपना पासवर्ड भूल गए?",
  "login.login_with_google": "Google के साथ लॉगिन करें",

  // Menu Page
  "menu.myMedicines": "मेरे दवाएँ",
  "menu.addMedicine": "दवा जोड़ें",
  "menu.blogs": "ब्लॉग",
  "menu.profile": "प्रोफाइल",

  'time_for_medicine': 'आपकी दवा का समय!',
  'take_medicine_now': 'अभी अपनी {dosageInfo} {medicineName} लें।',
};
