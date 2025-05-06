// lib/utils/localization/en_us.dart

const Map<String, String> enUS = {
  // General
  'general.appTitle': 'Medicine Reminder',
  'general.save': 'Save',
  'general.cancel': 'Cancel',
  'general.delete': 'Delete',
  'general.edit': 'Edit',
  'general.add': 'Add',
  'general.confirm': 'Confirm',
  'general.success': 'Success',
  'general.error': 'Error',
  'general.loading': 'Loading...',
  'general.requiredField': 'This field is required',

  // Auth
  'auth.login': 'Login',
  'auth.signup': 'Sign Up',
  'auth.logout': 'Logout',
  'auth.email': 'Email',
  'auth.password': 'Password',
  'auth.loginButton': 'Log In',
  'auth.signupButton': 'Sign Up',
  'auth.loginErrorTitle': 'Login Failed',
  'auth.signupErrorTitle': 'Signup Failed',
  'auth.unknownError': 'An unknown error occurred.',
  'auth.or': 'OR',
  'auth.noAccount': 'Don\"t have an account? Sign Up',
  'auth.haveAccount': 'Already have an account? Log In',

  // Home / Medicine List
  'home.title': 'My Medicines',
  'home.addMedicine': 'Add New Medicine',
  'home.noMedicines': 'No medicines added yet. Tap + to add one!',
  'home.confirmDeleteTitle': 'Delete Medicine',
  'home.confirmDeleteContent':
      'Are you sure you want to delete {medicineName}?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'Add Medicine',
  'addMedicine.titleEdit': 'Edit Medicine',
  'addMedicine.nameLabel': 'Medicine Name',
  'addMedicine.nameHint': 'e.g., Paracetamol',
  'addMedicine.typeLabel': 'Medicine Type/Category',
  'addMedicine.typeHint': 'e.g., Pill, Syrup, Injection',
  'addMedicine.dosageLabel': 'Dosage Quantity',
  'addMedicine.dosageHint': 'e.g., 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'Dosage Unit',
  'addMedicine.dosageUnitHint': 'e.g., tablet, mL, mg',
  'addMedicine.frequencyLabel': 'Frequency',
  'addMedicine.frequencyHint': 'e.g., Daily, Twice a day',
  'addMedicine.durationLabel': 'Duration (days)',
  'addMedicine.durationHint': 'e.g., 7, 14, 30 (0 for ongoing)',
  'addMedicine.whenToTakeLabel': 'When to Take / Notes',
  'addMedicine.whenToTakeHint': 'e.g., With food, Before bed',
  'addMedicine.startDateLabel': 'Start Date',
  'addMedicine.endDateLabel': 'End Date (Optional)',
  'addMedicine.selectDate': 'Select Date',
  'addMedicine.selectTime': 'Select Time',
  'addMedicine.timesLabel': 'Times per Day',
  'addMedicine.addTime': 'Add Time',
  'addMedicine.notesLabel': 'Additional Notes (Optional)',
  'addMedicine.notesHint': 'e.g., Store in a cool place',
  'addMedicine.enableNotificationsLabel': 'Enable Dose Reminders',
  'addMedicine.errorNumeric': 'Please enter a valid number',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Medicine added successfully.',
  'medicine.updateSuccess': 'Medicine updated successfully.',
  'medicine.deleteSuccess': 'Medicine deleted successfully.',
  'medicine.errorNeedTime': 'Please select at least one time.',

  // Settings Page
  'settings.title': 'Settings',
  'settings.language': 'Language',
  'settings.selectLanguage': 'Select Language',
  'settings.profile': 'Profile',

  // Introduction Screen
  'introduction.skip': 'Skip',
  'introduction.done': 'Done',
  'introduction.next': 'Next',

  // Filter
  'filter.allTypes': 'All Types',
  'filter.uncategorized': 'Uncategorized',
  'filter.searchHint': 'Search Medicines...',
  'filter.noResultsForSearchAndType': 'No results for \"{query}\" in {type}',
  'filter.noResultsForSearch': 'No results for \"{query}\"',
  'filter.noResultsForType': 'No results for type \"{type}\"',

  // Medicine Card
  'card.treatmentCompleted': 'Treatment Completed',
  'card.nextDoseN_A': 'Next dose: N/A',
  'card.todayAt': 'Today at',
  'card.tomorrowAt': 'Tomorrow at',
  'card.at': 'at',
  'card.nextDose': 'Next dose:',
  'card.frequency.onceDaily': 'Once daily',
  'card.frequency.twiceDaily': 'Twice daily',
  'card.frequency.thriceDaily': 'Thrice daily',
  'card.frequency.timesDaily': '{count} times daily',
};
