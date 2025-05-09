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
  'medicine.withFood': 'Avec la Nourriture',
  'medicine.deleteMedicineSuccessMessage': 'Médicament supprimé avec succès.',

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
  'developer': 'Développeur: Furkan Akif İŞLEK',
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
};
