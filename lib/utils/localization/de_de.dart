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
};
