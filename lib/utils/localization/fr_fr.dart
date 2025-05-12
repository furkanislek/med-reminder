// lib/utils/localization/fr_fr.dart

const Map<String, String> frFR = {
  // General
  'general.appTitle': 'Rappel de Médicaments',
  'general.save': 'Enregistrer',
  'general.cancel': 'Annuler',
  'general.delete': 'Supprimer',
  'general.edit': 'Modifier',
  'general.add': 'Ajouter',
  'general.confirm': 'Confirmer',
  'general.success': 'Succès',
  'general.error': 'Erreur',
  'general.loading': 'Chargement...',
  'general.requiredField': 'Ce champ est obligatoire',
  'general.done': 'Terminé',

  // Auth
  'auth.login': 'Connexion',
  'auth.signup': 'Inscription',
  'auth.logout': 'Déconnexion',
  'auth.email': 'E-mail',
  'auth.password': 'Mot de passe',
  'auth.loginButton': 'Se connecter',
  'auth.signupButton': 'S\'inscrire',
  'auth.loginErrorTitle': 'Échec de connexion',
  'auth.signupErrorTitle': 'Échec d\'inscription',
  'auth.unknownError': 'Une erreur inconnue s\'est produite.',
  'auth.or': 'OU',
  'auth.noAccount': 'Pas de compte? Inscrivez-vous',
  'auth.haveAccount': 'Vous avez déjà un compte? Connectez-vous',

  // Home / Medicine List
  'home.title': 'Mes Médicaments',
  'home.addMedicine': 'Ajouter un Nouveau Médicament',
  'home.noMedicines':
      'Aucun médicament ajouté. Appuyez sur + pour en ajouter un!',
  'home.confirmDeleteTitle': 'Supprimer le Médicament',
  'home.confirmDeleteContent':
      'Êtes-vous sûr de vouloir supprimer {medicineName}?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'Ajouter un Médicament',
  'addMedicine.titleEdit': 'Modifier le Médicament',
  'addMedicine.nameLabel': 'Nom du Médicament',
  'addMedicine.nameHint': 'ex. Paracétamol',
  'addMedicine.typeLabel': 'Type/Catégorie de Médicament',
  'addMedicine.typeHint': 'ex. Pilule, Sirop, Injection',
  'addMedicine.dosageLabel': 'Quantité de Dosage',
  'addMedicine.dosageHint': 'ex. 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'Unité de Dosage',
  'addMedicine.dosageUnitHint': 'ex. comprimé, mL, mg',
  'addMedicine.frequencyLabel': 'Fréquence',
  'addMedicine.frequencyHint': 'ex. Quotidien, Deux fois par jour',
  'addMedicine.durationLabel': 'Durée (jours)',
  'addMedicine.durationHint': 'ex. 7, 14, 30 (0 pour continu)',
  'addMedicine.whenToTakeLabel': 'Quand Prendre / Notes',
  'addMedicine.whenToTakeHint': 'ex. Avec la nourriture, Avant de dormir',
  'addMedicine.startDateLabel': 'Date de Début',
  'addMedicine.endDateLabel': 'Date de Fin (Optionnel)',
  'addMedicine.selectDate': 'Sélectionner une Date',
  'addMedicine.selectTime': 'Sélectionner une Heure',
  'addMedicine.timesLabel': 'Fois par Jour',
  'addMedicine.addTime': 'Ajouter une Heure',
  'addMedicine.notesLabel': 'Notes Supplémentaires (Optionnel)',
  'addMedicine.notesHint': 'ex. Conserver dans un endroit frais',
  'addMedicine.enableNotificationsLabel': 'Activer les Rappels de Dose',
  'addMedicine.errorNumeric': 'Veuillez entrer un nombre valide',
  'addMedicine.addMedicine': 'Ajouter un Médicament',
  'addMedicine.save': 'Enregistrer',
  'addMedicine.name': 'Nom du Médicament',
  'addMedicine.addMedicineHint': 'Nom du Médicament (ex. Paracétamol)',
  'addMedicine.dosage': 'Dosage',
  'addMedicine.dosageHint2': 'Quantité (ex. 500)',
  'addMedicine.dosageUnit': 'Unité (ex. mg)',
  'addMedicine.category': 'Catégorie',
  'addMedicine.frequency': 'Fréquence & Durée',
  'addMedicine.selectDoseTimes': 'Sélectionner les Heures de Dose',
  'addMedicine.times': 'fois sélectionnée(s)',
  'addMedicine.selectDuration': 'Sélectionner la Durée',
  'addMedicine.days': 'jour(s)',
  'addMedicine.whenToTake': 'Quand Prendre',
  'addMedicine.beforeFood': 'Avant de Manger',
  'addMedicine.afterFood': 'Après Manger',
  'addMedicine.notifications': 'Notifications',
  'addMedicine.enableNotifications': 'Activer les Rappels de Dose',
  'addMedicine.receiveNotification':
      'Recevoir une notification 5 minutes avant chaque dose',
  'addMedicine.doseTimesPickerTitle': 'Sélectionner les Heures de Dose',
  'addMedicine.done': 'Terminé',
  'addMedicine.deleteMedicine': 'Supprimer le Médicament',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Médicament ajouté avec succès.',
  'medicine.updateSuccess': 'Médicament mis à jour avec succès.',
  'medicine.deleteSuccess': 'Médicament supprimé avec succès.',
  'medicine.errorNeedTime': 'Veuillez sélectionner au moins une heure.',
  'medicine.saveMedicineSuccess': 'Médicament enregistré avec succès.',
  'medicine.saveMedicineError': 'Erreur',
  'medicine.saveMedicineErrorMessage':
      'Échec de l\'enregistrement du médicament: {e}',
  'medicine.updateMedicineSuccess': 'Médicament mis à jour avec succès.',
  'medicine.updateMedicineError': 'Erreur',
  'medicine.updateMedicineErrorMessage':
      'Échec de la mise à jour du médicament: {e}',
  'medicine.deleteMedicineSuccess': 'Médicament supprimé avec succès.',
  'medicine.deleteMedicineError': 'Erreur',
  'medicine.deleteMedicineErrorMessage':
      'Échec de la suppression du médicament: {e}',
  'medicine.saveMedicineSuccessMessage': 'Médicament enregistré avec succès.',
  'medicine.withFood': 'Avec la Nourriture',

  // Settings Page
  'settings.title': 'Paramètres',
  'settings.language': 'Langue',
  'settings.selectLanguage': 'Sélectionner la Langue',
  'settings.profile': 'Profil',

  // Introduction Screen
  'introduction.skip': 'Passer',
  'introduction.done': 'Terminé',
  'introduction.next': 'Suivant',

  // Filter
  'filter.allTypes': 'Tous les Types',
  'filter.uncategorized': 'Non Catégorisé',
  'filter.searchHint': 'Rechercher des Médicaments...',
  'filter.noResultsForSearchAndType':
      'Aucun résultat pour \"{query}\" dans {type}',
  'filter.noResultsForSearch': 'Aucun résultat pour \"{query}\"',
  'filter.noResultsForType': 'Aucun résultat pour le type \"{type}\"',

  // Medicine Card
  'card.treatmentCompleted': 'Traitement Terminé',
  'card.nextDoseN_A': 'Prochaine dose: N/A',
  'card.todayAt': 'Aujourd\'hui à',
  'card.tomorrowAt': 'Demain à',
  'card.at': 'à',
  'card.nextDose': 'Prochaine dose:',
  'card.frequency.onceDaily': 'Une fois par jour',
  'card.frequency.twiceDaily': 'Deux fois par jour',
  'card.frequency.thriceDaily': 'Trois fois par jour',
  'card.frequency.timesDaily': '{count} fois par jour',
  'addMedicine.nameLabelText': 'Nom',
  'addMedicine.dosageLabelText': 'Dosage',
  'addMedicine.dosageQuantityHint': 'Quantité (ex. 500)',
  'addMedicine.categoryLabel': 'Catégorie',
  'addMedicine.frequencyDurationLabel': 'Fréquence & Durée',
  'addMedicine.selectDoseTimesPlaceholder': 'Sélectionner les Heures de Dose',
  'addMedicine.doseTimesBottomSheetTitle': 'Sélectionner les Heures de Dose',
  'addMedicine.timesSelectedInfo': '{count} heure(s) sélectionnée(s)',
  'addMedicine.selectDurationPlaceholder': 'Sélectionner la Durée',
  'addMedicine.durationSelectedInfo': '{count} jour(s)',
  'addMedicine.whenToTakeLabelText': 'Quand Prendre',
  'addMedicine.beforeFoodOption': 'Avant de Manger',
  'addMedicine.afterFoodOption': 'Après Manger',
  'addMedicine.notificationsSectionLabel': 'Notifications',
  'addMedicine.notificationSubtext':
      'Recevoir une notification 5 minutes avant chaque dose',
  'addMedicine.durationPickerTitle': 'Sélectionner la Durée (en jours)',
  'addMedicine.durationPickerItemText': '{days} jour(s)',
  'addMedicine.timesSelected': 'fois sélectionnée(s)',
  'addMedicine.notificationsLabel': 'Notifications',
  'addMedicine.enableDoseReminders': 'Activer les Rappels de Dose',
  'addMedicine.remindersSubtext':
      'Recevoir une notification 5 minutes avant chaque dose',

  // Profile Page
  'personal_info': 'Informations Personnelles',
  'preferences': 'Préférences',
  'about_app': 'À Propos de l\'Application',
  'app_version': 'Version de l\'Application',
  'privacy_policy': 'Politique de Confidentialité',
  'developer': 'Développeur: Furkan Akif ISLEK',
  'noEmail': 'Aucun e-mail trouvé',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'Supprimer le Compte',
  'profile.deleteAccountImportantText':
      'Êtes-vous sûr de vouloir supprimer votre compte? Cette action ne peut pas être annulée.',
  'profile.cancel': 'Annuler',
  'profile.delete': 'Supprimer',
  'profile.errorDeletingAccount': 'Erreur lors de la suppression du compte',
  'profile.deleteAccountButton': 'Supprimer le Compte',

  // Profile Page
  'logout': 'Déconnexion',
  'account': 'Compte',

  // Blog Page
  'Blog': 'Blog',
  'Bir hata oluştu.': 'Une erreur est survenue.',
  'Blog yazısı bulunamadı.': 'Aucun article de blog trouvé.',
  'Şuan blog yok': 'Aucun blog disponible',
  'pills': 'Pilules',
  'health': 'Santé',
  'lifeStyle': 'Style de vie',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>Rappel de Médicaments - Politique de Confidentialité</h3><br><p><b>Utilisation des Informations Personnelles:</b><br>Notre application s\'engage à protéger la vie privée de nos utilisateurs. Dans notre application de rappel de médicaments, nous collectons les informations nécessaires (e-mail, informations de profil et plans de médication) pour le suivi des médicaments et les rappels. Ces informations sont utilisées pour fournir et améliorer notre service et ne sont pas partagées avec des tiers.</p><br><p><b>Stockage et Sécurité des Données:</b><br>Vos données utilisateur sont stockées sur des serveurs sécurisés au format crypté. Vos informations sur les médicaments et vos données personnelles sont protégées par des mesures de sécurité strictes. Seul le personnel nécessaire peut accéder à vos données.</p><br><p><b>Droits des Utilisateurs:</b><br>Les utilisateurs ont le droit de consulter, de modifier ou de supprimer leurs comptes et leurs données à tout moment. Lorsque vous supprimez votre compte, toutes vos données sont définitivement supprimées de notre système.</p><br><p><b>Cookies et Suivi:</b><br>Notre application peut utiliser des cookies pour améliorer l\'expérience utilisateur. Ces cookies stockent les préférences des utilisateurs et les données d\'utilisation de l\'application. Vous pouvez désactiver les cookies dans les paramètres de votre navigateur si vous le souhaitez.</p><br><p><b>Notifications:</b><br>Notre application n\'envoie des notifications que pour les rappels de médicaments approuvés par l\'utilisateur. Vous ne recevrez pas de notifications indésirables et vous pouvez désactiver les notifications dans la section des paramètres.</p><br><p><b>Modifications:</b><br>Notre politique de confidentialité peut être mise à jour de temps à autre. Les utilisateurs seront informés lorsqu\'il y aura des changements importants. En utilisant notre application, vous acceptez ces conditions.</p><br><p><b>Contact:</b><br>Veuillez nous contacter pour toute question concernant notre politique de confidentialité.</p>',

  // Introduction Page
  "introduction.page1.title":
      "Prenez Vos Médicaments à Temps, Préservez Votre Santé",
  "introduction.page1.description":
      "Il est facile d'oublier les heures de prise de médicaments dans l'agitation de la vie. Avec notre application, vous ne manquerez plus aucune dose. Configurez votre médicament, l'heure et la durée – nous vous le rappellerons à temps.",
  "introduction.page1.tip":
      "La santé commence par une dose de soin prise à temps.",

  "introduction.page2.title": "Suivez Votre Santé, Restez Informé",
  "introduction.page2.description":
      "Nous ne vous rappelons pas seulement, mais nous vous fournissons aussi des informations utiles sur votre santé. Renforcez vos habitudes de santé quotidiennes avec des articles de blog soutenus par des experts.",
  "introduction.page2.tip":
      "Une petite information peut faire une grande différence.",

  "introduction.page3.title": "Ouvert au Monde, Personnalisé pour Vous",
  "introduction.page3.description":
      "Notre application est accessible à tous avec un support pour 16 langues. Avec son interface facile à utiliser, ajoutez votre médicament en quelques touches et simplifiez votre vie.",
  "introduction.page3.tip":
      "La santé est universelle, et nous le sommes aussi.",

  "introduction.back": "Retour",
  "introduction.start": "Commencer",

  // Register Page
  "register.register_to_medreminder_app":
      "Inscrivez-vous à l'application Medreminder",
  "register.already_have_an_account": "Vous avez déjà un compte ? ",
  "register.sign_in": "Se connecter",
  "register.full_name": "Votre nom complet",
  "register.surname": "Votre nom de famille",
  "register.your_email": "Votre email",
  "register.type_your_password": "Tapez votre mot de passe",
  "register.re_type_your_password": "Retapez votre mot de passe",
  "register.register": "S'inscrire",
  "register.fill_all_fields": "Veuillez remplir tous les champs",
  "register.password_not_match": "Les mots de passe ne correspondent pas",
  "register.error_occurred": "Une erreur s'est produite",

  // Login Page
  "login.invalid_email": "Adresse email invalide",
  "login.user_disabled": "L'utilisateur a été désactivé",
  "login.email_already_in_use": "Cette adresse email est déjà utilisée",
  "login.wrong_password":
      "Les informations que vous avez entrées sont incorrectes",
  "login.email_not_verified": "Veuillez d'abord vérifier votre adresse email",
  "login.operation_not_allowed": "Cette opération n'est pas autorisée",
  "login.error_occurred": "Une erreur s'est produite",
  "login.error_occured_google":
      "Une erreur s'est produite lors de la connexion avec Google",
  "login.please_enter_your_email": "Veuillez entrer votre adresse email",
  "login.password_reset_email_sent":
      "Email de réinitialisation du mot de passe envoyé",
  "login.login_into_your_account": "Connectez-vous à votre compte",
  "login.dont_have_an_account": "Vous n'avez pas de compte ? ",
  "login.sign_up": "S'inscrire",
  "login.your_email": "Votre email",
  "login.type_your_password": "Tapez votre mot de passe",
  "login.login": "Se connecter",
  "login.forgot_password": "Mot de passe oublié ?",
  "login.or": "ou",
  "login.login_with_google": "Se connecter avec Google",
};
