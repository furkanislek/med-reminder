// lib/utils/localization/de_de.dart

const Map<String, String> deDE = {
  // General
  'general.appTitle': 'Medikamentenerinnerung',
  'general.save': 'Speichern',
  'general.cancel': 'Abbrechen',
  'general.delete': 'Löschen',
  'general.edit': 'Bearbeiten',
  'general.add': 'Hinzufügen',
  'general.confirm': 'Bestätigen',
  'general.success': 'Erfolg',
  'general.error': 'Fehler',
  'general.loading': 'Wird geladen...',
  'general.requiredField': 'Dieses Feld ist erforderlich',
  'general.done': 'Fertig',

  // Auth
  'auth.login': 'Anmelden',
  'auth.signup': 'Registrieren',
  'auth.logout': 'Abmelden',
  'auth.email': 'E-Mail',
  'auth.password': 'Passwort',
  'auth.loginButton': 'Anmelden',
  'auth.signupButton': 'Registrieren',
  'auth.loginErrorTitle': 'Anmeldung fehlgeschlagen',
  'auth.signupErrorTitle': 'Registrierung fehlgeschlagen',
  'auth.unknownError': 'Ein unbekannter Fehler ist aufgetreten.',
  'auth.or': 'ODER',
  'auth.noAccount': 'Kein Konto? Registrieren',
  'auth.haveAccount': 'Bereits ein Konto? Anmelden',

  // Home / Medicine List
  'home.title': 'Meine Medikamente',
  'home.addMedicine': 'Neues Medikament hinzufügen',
  'home.noMedicines':
      'Noch keine Medikamente hinzugefügt. Tippen Sie auf +, um eines hinzuzufügen!',
  'home.confirmDeleteTitle': 'Medikament löschen',
  'home.confirmDeleteContent':
      'Sind Sie sicher, dass Sie {medicineName} löschen möchten?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'Medikament hinzufügen',
  'addMedicine.titleEdit': 'Medikament bearbeiten',
  'addMedicine.nameLabel': 'Medikamentenname',
  'addMedicine.nameHint': 'z.B. Paracetamol',
  'addMedicine.typeLabel': 'Medikamententyp/Kategorie',
  'addMedicine.typeHint': 'z.B. Pille, Sirup, Injektion',
  'addMedicine.dosageLabel': 'Dosierungsmenge',
  'addMedicine.dosageHint': 'z.B. 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'Dosierungseinheit',
  'addMedicine.dosageUnitHint': 'z.B. Tablette, mL, mg',
  'addMedicine.frequencyLabel': 'Häufigkeit',
  'addMedicine.frequencyHint': 'z.B. Täglich, Zweimal täglich',
  'addMedicine.durationLabel': 'Dauer (Tage)',
  'addMedicine.durationHint': 'z.B. 7, 14, 30 (0 für fortlaufend)',
  'addMedicine.whenToTakeLabel': 'Einnahmezeit / Notizen',
  'addMedicine.whenToTakeHint': 'z.B. Mit Essen, Vor dem Schlafengehen',
  'addMedicine.startDateLabel': 'Startdatum',
  'addMedicine.endDateLabel': 'Enddatum (Optional)',
  'addMedicine.selectDate': 'Datum auswählen',
  'addMedicine.selectTime': 'Zeit auswählen',
  'addMedicine.timesLabel': 'Einnahme pro Tag',
  'addMedicine.addTime': 'Zeit hinzufügen',
  'addMedicine.notesLabel': 'Zusätzliche Notizen (Optional)',
  'addMedicine.notesHint': 'z.B. An einem kühlen Ort aufbewahren',
  'addMedicine.enableNotificationsLabel': 'Dosiserinnerungen aktivieren',
  'addMedicine.errorNumeric': 'Bitte geben Sie eine gültige Zahl ein',
  'addMedicine.addMedicine': 'Medikament hinzufügen',
  'addMedicine.save': 'Speichern',
  'addMedicine.name': 'Medikamentenname',
  'addMedicine.addMedicineHint': 'Medikamentenname (z.B. Paracetamol)',
  'addMedicine.dosage': 'Dosierung',
  'addMedicine.dosageHint2': 'Menge (z.B. 500)',
  'addMedicine.dosageUnit': 'Einheit (z.B. mg)',
  'addMedicine.category': 'Kategorie',
  'addMedicine.frequency': 'Häufigkeit & Dauer',
  'addMedicine.selectDoseTimes': 'Einnahmezeit auswählen',
  'addMedicine.times': 'Zeit(en) ausgewählt',
  'addMedicine.selectDuration': 'Dauer auswählen',
  'addMedicine.days': 'Tag(e)',
  'addMedicine.whenToTake': 'Wann einnehmen',
  'addMedicine.beforeFood': 'Vor dem Essen',
  'addMedicine.afterFood': 'Nach dem Essen',
  'addMedicine.notifications': 'Benachrichtigungen',
  'addMedicine.enableNotifications': 'Dosiserinnerungen aktivieren',
  'addMedicine.receiveNotification':
      'Erhalten Sie 5 Minuten vor jeder Dosis eine Benachrichtigung',
  'addMedicine.doseTimesPickerTitle': 'Einnahmezeit auswählen',
  'addMedicine.done': 'Fertig',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Medikament erfolgreich hinzugefügt.',
  'medicine.updateSuccess': 'Medikament erfolgreich aktualisiert.',
  'medicine.deleteSuccess': 'Medikament erfolgreich gelöscht.',
  'medicine.errorNeedTime': 'Bitte wählen Sie mindestens eine Zeit aus.',
  'medicine.saveMedicineSuccess': 'Medikament erfolgreich gespeichert.',
  'medicine.saveMedicineError': 'Fehler',
  'medicine.saveMedicineErrorMessage':
      'Fehler beim Speichern des Medikaments: {e}',
  'medicine.updateMedicineSuccess': 'Medikament erfolgreich aktualisiert.',
  'medicine.updateMedicineError': 'Fehler',
  'medicine.updateMedicineErrorMessage':
      'Fehler beim Aktualisieren des Medikaments: {e}',
  'medicine.deleteMedicineSuccess': 'Medikament erfolgreich gelöscht.',
  'medicine.deleteMedicineError': 'Fehler',
  'medicine.deleteMedicineErrorMessage':
      'Fehler beim Löschen des Medikaments: {e}',
  'medicine.withFood': 'Mit Essen',
  'medicine.deleteMedicineSuccessMessage': 'Medikament erfolgreich gelöscht.',
  'medicine.saveMedicineSuccessMessage': 'Medikament erfolgreich gespeichert.',

  // Settings Page
  'settings.title': 'Einstellungen',
  'settings.language': 'Sprache',
  'settings.selectLanguage': 'Sprache auswählen',
  'settings.profile': 'Profil',

  // Introduction Screen
  'introduction.skip': 'Überspringen',
  'introduction.done': 'Fertig',
  'introduction.next': 'Weiter',

  // Filter
  'filter.allTypes': 'Alle Typen',
  'filter.uncategorized': 'Nicht kategorisiert',
  'filter.searchHint': 'Medikamente suchen...',
  'filter.noResultsForSearchAndType':
      'Keine Ergebnisse für \"{query}\" in {type}',
  'filter.noResultsForSearch': 'Keine Ergebnisse für \"{query}\"',
  'filter.noResultsForType': 'Keine Ergebnisse für Typ \"{type}\"',

  // Medicine Card
  'card.treatmentCompleted': 'Behandlung abgeschlossen',
  'card.nextDoseN_A': 'Nächste Dosis: N/A',
  'card.todayAt': 'Heute um',
  'card.tomorrowAt': 'Morgen um',
  'card.at': 'um',
  'card.nextDose': 'Nächste Dosis:',
  'card.frequency.onceDaily': 'Einmal täglich',
  'card.frequency.twiceDaily': 'Zweimal täglich',
  'card.frequency.thriceDaily': 'Dreimal täglich',
  'card.frequency.timesDaily': '{count} mal täglich',
  'addMedicine.nameLabelText': 'Name',
  'addMedicine.dosageLabelText': 'Dosierung',
  'addMedicine.dosageQuantityHint': 'Menge (z.B. 500)',
  'addMedicine.categoryLabel': 'Kategorie',
  'addMedicine.frequencyDurationLabel': 'Häufigkeit & Dauer',
  'addMedicine.selectDoseTimesPlaceholder': 'Einnahmezeit auswählen',
  'addMedicine.doseTimesBottomSheetTitle': 'Einnahmezeit auswählen',
  'addMedicine.timesSelectedInfo': '{count} Zeit(en) ausgewählt',
  'addMedicine.selectDurationPlaceholder': 'Dauer auswählen',
  'addMedicine.durationSelectedInfo': '{count} Tag(e)',
  'addMedicine.whenToTakeLabelText': 'Wann einnehmen',
  'addMedicine.beforeFoodOption': 'Vor dem Essen',
  'addMedicine.afterFoodOption': 'Nach dem Essen',
  'addMedicine.notificationsSectionLabel': 'Benachrichtigungen',
  'addMedicine.notificationSubtext':
      'Erhalten Sie 5 Minuten vor jeder Dosis eine Benachrichtigung',
  'addMedicine.durationPickerTitle': 'Dauer auswählen (in Tagen)',
  'addMedicine.durationPickerItemText': '{days} Tag(e)',
  'addMedicine.timesSelected': 'Zeit(en) ausgewählt',
  'addMedicine.notificationsLabel': 'Benachrichtigungen',
  'addMedicine.enableDoseReminders': 'Dosiserinnerungen aktivieren',
  'addMedicine.remindersSubtext':
      'Erhalten Sie 5 Minuten vor jeder Dosis eine Benachrichtigung',
  'addMedicine.deleteMedicine': 'Medikament löschen',

  // Profile Page
  'personal_info': 'Persönliche Informationen',
  'preferences': 'Einstellungen',
  'about_app': 'Über die App',
  'app_version': 'App-Version',
  'privacy_policy': 'Datenschutzrichtlinie',
  'developer': 'Entwickler: Furkan Akif ISLEK',
  'noEmail': 'Keine E-Mail gefunden',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'Konto löschen',
  'profile.deleteAccountImportantText':
      'Sind Sie sicher, dass Sie Ihr Konto löschen möchten? Diese Aktion kann nicht rückgängig gemacht werden.',
  'profile.cancel': 'Abbrechen',
  'profile.delete': 'Löschen',
  'profile.errorDeletingAccount': 'Fehler beim Löschen des Kontos',
  'profile.deleteAccountButton': 'Konto löschen',

  // Profile Page
  'logout': 'Abmelden',
  'account': 'Konto',

  // Blog Page
  'Blog': 'Blog',
  'Bir hata oluştu.': 'Ein Fehler ist aufgetreten.',
  'Blog yazısı bulunamadı.': 'Keine Blogbeiträge gefunden.',
  'Şuan blog yok': 'Keine Blogs verfügbar',
  'pills': 'Pillen',
  'health': 'Gesundheit',
  'lifeStyle': 'Lebensstil',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>Medikamentenerinnerung - Datenschutzrichtlinie</h3><br><p><b>Verwendung personenbezogener Daten:</b><br>Unsere Anwendung verpflichtet sich, die Privatsphäre unserer Benutzer zu schützen. In unserer Medikamentenerinnerungs-App sammeln wir notwendige Informationen (E-Mail, Profilinformationen und Medikamentenpläne) für die Medikamentenverfolgung und Erinnerungen. Diese Informationen werden verwendet, um unseren Service bereitzustellen und zu verbessern und werden nicht an Dritte weitergegeben.</p><br><p><b>Datenspeicherung und Sicherheit:</b><br>Ihre Benutzerdaten werden auf sicheren Servern in verschlüsseltem Format gespeichert. Ihre Medikamenteninformationen und persönlichen Daten sind durch starke Sicherheitsmaßnahmen geschützt. Nur das notwendige Personal kann auf Ihre Daten zugreifen.</p><br><p><b>Benutzerrechte:</b><br>Benutzer haben das Recht, ihre Konten und Daten jederzeit einzusehen, zu bearbeiten oder zu löschen. Wenn Sie Ihr Konto löschen, werden alle Ihre Daten dauerhaft aus unserem System entfernt.</p><br><p><b>Cookies und Tracking:</b><br>Unsere Anwendung kann Cookies verwenden, um die Benutzererfahrung zu verbessern. Diese Cookies speichern Benutzereinstellungen und Anwendungsnutzungsdaten. Sie können Cookies in Ihren Browsereinstellungen deaktivieren, wenn Sie möchten.</p><br><p><b>Benachrichtigungen:</b><br>Unsere Anwendung sendet nur Benachrichtigungen für Medikamentenerinnerungen, die vom Benutzer genehmigt wurden. Sie erhalten keine unerwünschten Benachrichtigungen und können Benachrichtigungen im Einstellungsbereich deaktivieren.</p><br><p><b>Änderungen:</b><br>Unsere Datenschutzrichtlinie kann von Zeit zu Zeit aktualisiert werden. Benutzer werden benachrichtigt, wenn es wesentliche Änderungen gibt. Durch die Nutzung unserer Anwendung stimmen Sie diesen Bedingungen zu.</p><br><p><b>Kontakt:</b><br>Bitte kontaktieren Sie uns bei Fragen zu unserer Datenschutzrichtlinie.</p>',

  // Introduction Page
  "introduction.page1.title":
      "Nehmen Sie Ihre Medikamente pünktlich, schützen Sie Ihre Gesundheit",
  "introduction.page1.description":
      "Es ist leicht, im Trubel des Lebens die Medikamentenzeiten zu vergessen. Mit unserer App verpassen Sie keine Dosis mehr. Legen Sie Ihr Medikament, die Zeit und die Dauer fest – wir erinnern Sie rechtzeitig daran.",
  "introduction.page1.tip":
      "Gesundheit beginnt mit einer pünktlich eingenommenen Dosis Sorgfalt.",

  "introduction.page2.title":
      "Verfolgen Sie Ihre Gesundheit, bleiben Sie informiert",
  "introduction.page2.description":
      "Wir erinnern Sie nicht nur, sondern liefern Ihnen auch nützliche Informationen über Ihre Gesundheit. Stärken Sie Ihre täglichen Gesundheitsgewohnheiten mit von Experten unterstützten Blogbeiträgen.",
  "introduction.page2.tip":
      "Eine kleine Information kann einen großen Unterschied machen.",

  "introduction.page3.title": "Offen für die Welt, personalisiert für Sie",
  "introduction.page3.description":
      "Unsere App ist für jeden zugänglich mit Unterstützung für 16 Sprachen. Mit ihrer benutzerfreundlichen Oberfläche fügen Sie Ihr Medikament mit nur wenigen Berührungen hinzu und machen Ihr Leben einfacher.",
  "introduction.page3.tip": "Gesundheit ist universell, und wir sind es auch.",

  "introduction.back": "Zurück",
  "introduction.start": "Starten",

  // Register Page
  "register.register_to_medreminder_app":
      "Registrieren Sie sich bei der Medreminder-App",
  "register.already_have_an_account": "Haben Sie bereits ein Konto? ",
  "register.sign_in": "Anmelden",
  "register.full_name": "Ihr vollständiger Name",
  "register.surname": "Ihr Nachname",
  "register.your_email": "Ihre E-Mail",
  "register.type_your_password": "Geben Sie Ihr Passwort ein",
  "register.re_type_your_password": "Passwort erneut eingeben",
  "register.register": "Registrieren",
  "register.fill_all_fields": "Bitte füllen Sie alle Felder aus",
  "register.password_not_match": "Passwörter stimmen nicht überein",
  "register.error_occurred": "Ein Fehler ist aufgetreten",

  // Login Page
  "login.invalid_email": "Ungültige E-Mail-Adresse",
  "login.user_disabled": "Benutzer wurde deaktiviert",
  "login.email_already_in_use": "Diese E-Mail-Adresse wird bereits verwendet",
  "login.wrong_password": "Die eingegebenen Informationen sind falsch",
  "login.email_not_verified": "Bitte bestätigen Sie zuerst Ihre E-Mail-Adresse",
  "login.operation_not_allowed": "Dieser Vorgang ist nicht erlaubt",
  "login.error_occurred": "Ein Fehler ist aufgetreten",
  "login.error_occured_google":
      "Bei der Anmeldung mit Google ist ein Fehler aufgetreten",
  "login.please_enter_your_email": "Bitte geben Sie Ihre E-Mail-Adresse ein",
  "login.password_reset_email_sent":
      "E-Mail zum Zurücksetzen des Passworts gesendet",
  "login.login_into_your_account": "In Ihr Konto einloggen",
  "login.dont_have_an_account": "Sie haben noch kein Konto? ",
  "login.sign_up": "Registrieren",
  "login.your_email": "Ihre E-Mail",
  "login.type_your_password": "Geben Sie Ihr Passwort ein",
  "login.login": "Anmelden",
  "login.forgot_password": "Passwort vergessen?",
  "login.or": "oder",
  "login.login_with_google": "Mit Google anmelden",

  // Menu Page
  "menu.myMedicines": "Meine Medikamente",
  "menu.addMedicine": "Medikament hinzufügen",
  "menu.blogs": "Blog",
  "menu.profile": "Profil",
};
