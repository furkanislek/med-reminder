// lib/utils/localization/it_it.dart

const Map<String, String> itIT = {
  // General
  'general.appTitle': 'Promemoria Farmaci',
  'general.save': 'Salva',
  'general.cancel': 'Annulla',
  'general.delete': 'Elimina',
  'general.edit': 'Modifica',
  'general.add': 'Aggiungi',
  'general.confirm': 'Conferma',
  'general.success': 'Successo',
  'general.error': 'Errore',
  'general.loading': 'Caricamento...',
  'general.requiredField': 'Questo campo è obbligatorio',
  'general.done': 'Fatto',

  // Auth
  'auth.login': 'Accedi',
  'auth.signup': 'Registrati',
  'auth.logout': 'Esci',
  'auth.email': 'Email',
  'auth.password': 'Password',
  'auth.loginButton': 'Accedi',
  'auth.signupButton': 'Registrati',
  'auth.loginErrorTitle': 'Accesso fallito',
  'auth.signupErrorTitle': 'Registrazione fallita',
  'auth.unknownError': 'Si è verificato un errore sconosciuto.',
  'auth.or': 'OPPURE',
  'auth.noAccount': 'Non hai un account? Registrati',
  'auth.haveAccount': 'Hai già un account? Accedi',

  // Home / Medicine List
  'home.title': 'I miei farmaci',
  'home.addMedicine': 'Aggiungi nuovo farmaco',
  'home.noMedicines': 'Nessun farmaco aggiunto. Tocca + per aggiungerne uno!',
  'home.confirmDeleteTitle': 'Elimina farmaco',
  'home.confirmDeleteContent': 'Sei sicuro di voler eliminare {medicineName}?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'Aggiungi farmaco',
  'addMedicine.titleEdit': 'Modifica farmaco',
  'addMedicine.nameLabel': 'Nome farmaco',
  'addMedicine.nameHint': 'es. Paracetamolo',
  'addMedicine.typeLabel': 'Tipo/Categoria farmaco',
  'addMedicine.typeHint': 'es. Pillola, Sciroppo, Iniezione',
  'addMedicine.dosageLabel': 'Quantità dose',
  'addMedicine.dosageHint': 'es. 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'Unità dose',
  'addMedicine.dosageUnitHint': 'es. compressa, mL, mg',
  'addMedicine.frequencyLabel': 'Frequenza',
  'addMedicine.frequencyHint': 'es. Giornaliero, Due volte al giorno',
  'addMedicine.durationLabel': 'Durata (giorni)',
  'addMedicine.durationHint': 'es. 7, 14, 30 (0 per continuo)',
  'addMedicine.whenToTakeLabel': 'Quando assumere / Note',
  'addMedicine.whenToTakeHint': 'es. Con i pasti, Prima di dormire',
  'addMedicine.startDateLabel': 'Data inizio',
  'addMedicine.endDateLabel': 'Data fine (Opzionale)',
  'addMedicine.selectDate': 'Seleziona data',
  'addMedicine.selectTime': 'Seleziona ora',
  'addMedicine.timesLabel': 'Volte al giorno',
  'addMedicine.addTime': 'Aggiungi ora',
  'addMedicine.notesLabel': 'Note aggiuntive (Opzionale)',
  'addMedicine.notesHint': 'es. Conservare in luogo fresco',
  'addMedicine.enableNotificationsLabel': 'Attiva promemoria dosi',
  'addMedicine.errorNumeric': 'Inserisci un numero valido',
  'addMedicine.addMedicine': 'Aggiungi farmaco',
  'addMedicine.save': 'Salva',
  'addMedicine.name': 'Nome farmaco',
  'addMedicine.addMedicineHint': 'Nome farmaco (es. Paracetamolo)',
  'addMedicine.dosage': 'Dosaggio',
  'addMedicine.dosageHint2': 'Quantità (es. 500)',
  'addMedicine.dosageUnit': 'Unità (es. mg)',
  'addMedicine.category': 'Categoria',
  'addMedicine.frequency': 'Frequenza & Durata',
  'addMedicine.selectDoseTimes': 'Seleziona orari dose',
  'addMedicine.times': 'volte selezionate',
  'addMedicine.selectDuration': 'Seleziona durata',
  'addMedicine.days': 'giorni',
  'addMedicine.whenToTake': 'Quando assumere',
  'addMedicine.beforeFood': 'Prima dei pasti',
  'addMedicine.afterFood': 'Dopo i pasti',
  'addMedicine.notifications': 'Notifiche',
  'addMedicine.enableNotifications': 'Attiva promemoria dosi',
  'addMedicine.receiveNotification':
      'Ricevi una notifica 5 minuti prima di ogni dose',
  'addMedicine.doseTimesPickerTitle': 'Seleziona orari dose',
  'addMedicine.done': 'Fatto',
  'addMedicine.deleteMedicine': 'Elimina farmaco',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Farmaco aggiunto con successo.',
  'medicine.updateSuccess': 'Farmaco aggiornato con successo.',
  'medicine.deleteSuccess': 'Farmaco eliminato con successo.',
  'medicine.errorNeedTime': 'Seleziona almeno un orario.',
  'medicine.saveMedicineSuccess': 'Farmaco salvato con successo.',
  'medicine.saveMedicineError': 'Errore',
  'medicine.saveMedicineErrorMessage': 'Errore nel salvare il farmaco: {e}',
  'medicine.updateMedicineSuccess': 'Farmaco aggiornato con successo.',
  'medicine.updateMedicineError': 'Errore',
  'medicine.updateMedicineErrorMessage':
      'Errore nell\'aggiornare il farmaco: {e}',
  'medicine.deleteMedicineSuccess': 'Farmaco eliminato con successo.',
  'medicine.deleteMedicineError': 'Errore',
  'medicine.deleteMedicineErrorMessage':
      'Errore nell\'eliminare il farmaco: {e}',
  'medicine.withFood': 'Con i pasti',
  'medicine.deleteMedicineSuccessMessage': 'Farmaco eliminato con successo.',
  'medicine.saveMedicineSuccessMessage': 'Farmaco salvato con successo.',

  // Settings Page
  'settings.title': 'Impostazioni',
  'settings.language': 'Lingua',
  'settings.selectLanguage': 'Seleziona lingua',
  'settings.profile': 'Profilo',

  // Introduction Screen
  'introduction.skip': 'Salta',
  'introduction.done': 'Fatto',
  'introduction.next': 'Avanti',

  // Filter
  'filter.allTypes': 'Tutti i tipi',
  'filter.uncategorized': 'Non categorizzato',
  'filter.searchHint': 'Cerca farmaci...',
  'filter.noResultsForSearchAndType':
      'Nessun risultato per \"{query}\" in {type}',
  'filter.noResultsForSearch': 'Nessun risultato per \"{query}\"',
  'filter.noResultsForType': 'Nessun risultato per il tipo \"{type}\"',

  // Medicine Card
  'card.treatmentCompleted': 'Trattamento completato',
  'card.nextDoseN_A': 'Prossima dose: N/D',
  'card.todayAt': 'Oggi alle',
  'card.tomorrowAt': 'Domani alle',
  'card.at': 'alle',
  'card.nextDose': 'Prossima dose:',
  'card.frequency.onceDaily': 'Una volta al giorno',
  'card.frequency.twiceDaily': 'Due volte al giorno',
  'card.frequency.thriceDaily': 'Tre volte al giorno',
  'card.frequency.timesDaily': '{count} volte al giorno',
  'addMedicine.nameLabelText': 'Nome',
  'addMedicine.dosageLabelText': 'Dosaggio',
  'addMedicine.dosageQuantityHint': 'Quantità (es. 500)',
  'addMedicine.categoryLabel': 'Categoria',
  'addMedicine.frequencyDurationLabel': 'Frequenza & Durata',
  'addMedicine.selectDoseTimesPlaceholder': 'Seleziona orari dose',
  'addMedicine.doseTimesBottomSheetTitle': 'Seleziona orari dose',
  'addMedicine.timesSelectedInfo': '{count} volte selezionate',
  'addMedicine.selectDurationPlaceholder': 'Seleziona durata',
  'addMedicine.durationSelectedInfo': '{count} giorni',
  'addMedicine.whenToTakeLabelText': 'Quando assumere',
  'addMedicine.beforeFoodOption': 'Prima dei pasti',
  'addMedicine.afterFoodOption': 'Dopo i pasti',
  'addMedicine.notificationsSectionLabel': 'Notifiche',
  'addMedicine.notificationSubtext':
      'Ricevi una notifica 5 minuti prima di ogni dose',
  'addMedicine.durationPickerTitle': 'Seleziona durata (in giorni)',
  'addMedicine.durationPickerItemText': '{days} giorni',
  'addMedicine.timesSelected': 'volte selezionate',
  'addMedicine.notificationsLabel': 'Notifiche',
  'addMedicine.enableDoseReminders': 'Attiva promemoria dosi',
  'addMedicine.remindersSubtext':
      'Ricevi una notifica 5 minuti prima di ogni dose',

  // Profile Page
  'personal_info': 'Informazioni personali',
  'preferences': 'Preferenze',
  'about_app': 'Info applicazione',
  'app_version': 'Versione app',
  'privacy_policy': 'Informativa privacy',
  'developer': 'Sviluppatore: Furkan Akif ISLEK',
  'noEmail': 'Nessuna email trovata',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'Elimina account',
  'profile.deleteAccountImportantText':
      'Sei sicuro di voler eliminare il tuo account? Questa azione non può essere annullata.',
  'profile.cancel': 'Annulla',
  'profile.delete': 'Elimina',
  'profile.errorDeletingAccount': 'Errore nell\'eliminare l\'account',
  'profile.deleteAccountButton': 'Elimina account',

  // Profile Page
  'logout': 'Disconnetti',
  'account': 'Account',

  // Blog Page
  'Blog': 'Blog',
  'Bir hata oluştu.': 'Si è verificato un errore.',
  'Blog yazısı bulunamadı.': 'Nessun post del blog trovato.',
  'Şuan blog yok': 'Nessun blog disponibile',
  'pills': 'Pillole',
  'health': 'Salute',
  'lifeStyle': 'Stile di Vita',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>Promemoria Medicinali - Politica sulla Privacy</h3><br><p><b>Utilizzo delle Informazioni Personali:</b><br>La nostra applicazione si impegna a proteggere la privacy dei nostri utenti. Nella nostra app di promemoria medicinali, raccogliamo le informazioni necessarie (email, informazioni del profilo e piani di medicazione) per il monitoraggio dei farmaci e i promemoria. Queste informazioni vengono utilizzate per fornire e migliorare il nostro servizio e non vengono condivise con terze parti.</p><br><p><b>Archiviazione e Sicurezza dei Dati:</b><br>I tuoi dati utente sono memorizzati su server sicuri in formato criptato. Le tue informazioni sui medicinali e i tuoi dati personali sono protetti da forti misure di sicurezza. Solo il personale necessario può accedere ai tuoi dati.</p><br><p><b>Diritti dell\'Utente:</b><br>Gli utenti hanno il diritto di visualizzare, modificare o eliminare i propri account e dati in qualsiasi momento. Quando elimini il tuo account, tutti i tuoi dati vengono rimossi permanentemente dal nostro sistema.</p><br><p><b>Cookie e Tracciamento:</b><br>La nostra applicazione potrebbe utilizzare cookie per migliorare l\'esperienza utente. Questi cookie memorizzano le preferenze degli utenti e i dati di utilizzo dell\'applicazione. Puoi disabilitare i cookie dalle impostazioni del tuo browser se lo desideri.</p><br><p><b>Notifiche:</b><br>La nostra applicazione invia notifiche solo per i promemoria di medicinali approvati dall\'utente. Non riceverai notifiche indesiderate e puoi disabilitare le notifiche dalla sezione impostazioni.</p><br><p><b>Modifiche:</b><br>La nostra politica sulla privacy potrebbe essere aggiornata di tanto in tanto. Gli utenti saranno informati quando ci saranno cambiamenti significativi. Utilizzando la nostra applicazione, accetti questi termini.</p><br><p><b>Contatto:</b><br>Contattaci per qualsiasi domanda sulla nostra politica sulla privacy.</p>',

  // Introduction Page
  "introduction.page1.title":
      "Prendi i Tuoi Farmaci in Tempo, Proteggi la Tua Salute",
  "introduction.page1.description":
      "È facile dimenticare gli orari dei farmaci nella frenesia della vita. Con la nostra app, non perderai più alcuna dose. Imposta il tuo farmaco, l'orario e la durata – ti ricorderemo quando è il momento.",
  "introduction.page1.tip":
      "La salute inizia con una dose di attenzione presa al momento giusto.",

  "introduction.page2.title": "Monitora la Tua Salute, Resta Informato",
  "introduction.page2.description":
      "Non solo ti ricordiamo, ma ti forniamo anche informazioni utili sulla tua salute. Rafforza le tue abitudini quotidiane con articoli del blog supportati da esperti.",
  "introduction.page2.tip":
      "Una piccola informazione può fare una grande differenza.",

  "introduction.page3.title": "Aperto al Mondo, Personalizzato per Te",
  "introduction.page3.description":
      "La nostra app è accessibile a tutti con supporto per 16 lingue. Con la sua interfaccia facile da usare, aggiungi i tuoi farmaci con pochi tocchi e rendi la tua vita più semplice.",
  "introduction.page3.tip": "La salute è universale, e anche noi lo siamo.",

  "introduction.back": "Indietro",
  "introduction.start": "Inizia",

  // Register Page
  "register.register_to_medreminder_app": "Registrati all'app Medreminder",
  "register.already_have_an_account": "Hai già un account? ",
  "register.sign_in": "Accedi",
  "register.full_name": "Il tuo nome completo",
  "register.surname": "Il tuo cognome",
  "register.your_email": "La tua email",
  "register.type_your_password": "Inserisci la tua password",
  "register.re_type_your_password": "Reinserisci la tua password",
  "register.register": "Registrati",
  "register.fill_all_fields": "Per favore compila tutti i campi",
  "register.password_not_match": "Le password non corrispondono",
  "register.error_occurred": "Si è verificato un errore",

  // Login Page
  "login.invalid_email": "Indirizzo email non valido",
  "login.user_disabled": "L'utente è stato disabilitato",
  "login.email_already_in_use": "Questo indirizzo email è già in uso",
  "login.wrong_password": "Le informazioni inserite non sono corrette",
  "login.email_not_verified":
      "Per favore, verifica prima il tuo indirizzo email",
  "login.operation_not_allowed": "Questa operazione non è consentita",
  "login.error_occurred": "Si è verificato un errore",
  "login.error_occured_google":
      "Si è verificato un errore durante l'accesso con Google",
  "login.please_enter_your_email":
      "Per favore, inserisci il tuo indirizzo email",
  "login.password_reset_email_sent":
      "Email per il reset della password inviata",
  "login.login_into_your_account": "Accedi al tuo account",
  "login.dont_have_an_account": "Non hai un account? ",
  "login.sign_up": "Registrati",
  "login.your_email": "La tua email",
  "login.type_your_password": "Inserisci la tua password",
  "login.login": "Accedi",
  "login.forgot_password": "Hai dimenticato la password?",
  "login.or": "oppure",
  "login.login_with_google": "Accedi con Google",

  // Menu Page
  "menu.myMedicines": "I miei farmaci",
  "menu.addMedicine": "Aggiungi farmaco",
  "menu.blogs": "Blog",
  "menu.profile": "Profilo",

  'time_for_medicine': 'È ora di prendere la medicina!',
  'take_medicine_now': 'Prendi {dosageInfo} di {medicineName} adesso.',
};
