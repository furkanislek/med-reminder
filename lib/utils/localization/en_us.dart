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
  'general.done': 'Done',

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
  'auth.checkEmail': 'Check your e-mail',
  'auth.resetPasswordInfo':
      'We have sent you informations\n to reset your password',
  'auth.registerSuccessInfo':
      'Registration successful. Please confirm your account\n with the link sent to your e-mail address.',
  'auth.resetPassword': 'Reset password',
  'auth.resetPasswordInstructions':
      'Enter your e-mail address and we will send you further instructions on how to reset the password.',
  'auth.yourEmail': 'Your e-mail',
  'auth.resetButton': 'Reset Password',
  'auth.emailRequired': 'Please enter your e-mail address.',

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
  'addMedicine.addMedicine': 'Add Medicine',
  'addMedicine.save': 'Save',
  'addMedicine.name': 'Medicine Name',
  'addMedicine.addMedicineHint': 'Medicine Name (e.g., Paracetamol)',
  'addMedicine.dosage': 'Dosage',
  'addMedicine.dosageHint2': 'Quantity (e.g., 500)',
  'addMedicine.dosageUnit': 'Unit (e.g., mg)',
  'addMedicine.category': 'Category',
  'addMedicine.frequency': 'Frequency & Duration',
  'addMedicine.selectDoseTimes': 'Select Dose Times',
  'addMedicine.times': 'time(s) selected',
  'addMedicine.selectDuration': 'Select Duration',
  'addMedicine.days': 'day(s)',
  'addMedicine.whenToTake': 'When to Take',
  'addMedicine.beforeFood': 'Before Food',
  'addMedicine.afterFood': 'After Food',
  'addMedicine.notifications': 'Notifications',
  'addMedicine.enableNotifications': 'Enable Dose Reminders',
  'addMedicine.receiveNotification':
      'Receive a notification 5 minutes before each dose',
  'addMedicine.doseTimesPickerTitle': 'Select Dose Times',
  'addMedicine.done': 'Done',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Medicine added successfully.',
  'medicine.updateSuccess': 'Medicine updated successfully.',
  'medicine.deleteSuccess': 'Medicine deleted successfully.',
  'medicine.errorNeedTime': 'Please select at least one time.',
  'medicine.saveMedicineSuccess': 'Medicine saved successfully.',
  'medicine.saveMedicineError': 'Error',
  'medicine.saveMedicineErrorMessage': 'Failed to save medicine: {e}',
  'medicine.updateMedicineSuccess': 'Medicine updated successfully.',
  'medicine.updateMedicineError': 'Error',
  'medicine.updateMedicineErrorMessage': 'Failed to update medicine: {e}',
  'medicine.deleteMedicineSuccess': 'Medicine deleted successfully.',
  'medicine.deleteMedicineError': 'Error',
  'medicine.deleteMedicineErrorMessage': 'Failed to delete medicine: {e}',
  'medicine.withFood': 'With Food',
  'medicine.deleteMedicineSuccessMessage': 'Medicine deleted successfully.',
  'medicine.saveMedicineSuccessMessage': 'Medicine saved successfully.',

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
  'addMedicine.nameLabelText': 'Name',
  'addMedicine.dosageLabelText': 'Dosage',
  'addMedicine.dosageQuantityHint': 'Quantity (e.g., 500)',
  'addMedicine.categoryLabel': 'Category',
  'addMedicine.frequencyDurationLabel': 'Frequency & Duration',
  'addMedicine.selectDoseTimesPlaceholder': 'Select Dose Times',
  'addMedicine.doseTimesBottomSheetTitle': 'Select Dose Times',
  'addMedicine.timesSelectedInfo': '{count} time(s) selected',
  'addMedicine.selectDurationPlaceholder': 'Select Duration',
  'addMedicine.durationSelectedInfo': '{count} day(s)',
  'addMedicine.whenToTakeLabelText': 'When to Take',
  'addMedicine.beforeFoodOption': 'Before Food',
  'addMedicine.afterFoodOption': 'After Food',
  'addMedicine.notificationsSectionLabel': 'Notifications',
  'addMedicine.notificationSubtext':
      'Receive a notification 5 minutes before each dose',
  'addMedicine.durationPickerTitle': 'Select Duration (in days)',
  'addMedicine.durationPickerItemText': '{days} day(s)',
  'addMedicine.timesSelected': 'times selected',
  "addMedicine.notificationsLabel": "Notifications",
  'addMedicine.enableDoseReminders': 'Enable Dose Reminders',
  'addMedicine.remindersSubtext':
      'Receive a notification 5 minutes before each dose',
  'addMedicine.deleteMedicine': 'Delete Medicine',

  // Profile Page
  'personal_info': 'Personal Information',
  'preferences': 'Preferences',
  'about_app': 'About App',
  'app_version': 'App Version',
  'privacy_policy': 'Privacy Policy',
  'developer': 'Developer: Furkan Akif ISLEK',
  'noEmail': 'No email found',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'Delete Account',
  'profile.deleteAccountImportantText':
      'Are you sure you want to delete your account? This action cannot be undone.',
  'profile.cancel': 'Cancel',
  'profile.delete': 'Delete',
  'profile.errorDeletingAccount': 'Error deleting account',
  'profile.deleteAccountButton': 'Delete Account',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>Medicine Reminder - Privacy Policy</h3><br><p><b>Use of Personal Information:</b><br>Our application is committed to protecting the privacy of our users. In our medicine reminder app, we collect necessary information (email, profile information, and medication plans) for medication tracking and reminders. This information is used to provide and improve our service and is not shared with third parties.</p><br><p><b>Data Storage and Security:</b><br>Your user data is stored on secure servers in encrypted format. Your medication information and personal data are protected under strong security measures. Only necessary personnel can access your data.</p><br><p><b>User Rights:</b><br>Users have the right to view, edit, or delete their accounts and data at any time. When you delete your account, all your data is permanently removed from our system.</p><br><p><b>Cookies and Tracking:</b><br>Our application may use cookies to improve the user experience. These cookies store user preferences and application usage data. You can disable cookies from your browser settings if you wish.</p><br><p><b>Notifications:</b><br>Our application only sends notifications for medication reminders approved by the user. You will not receive unwanted notifications and can disable notifications from the settings section.</p><br><p><b>Changes:</b><br>Our privacy policy may be updated from time to time. Users will be notified when there are significant changes. By using our application, you agree to these terms.</p><br><p><b>Contact:</b><br>Please contact us with any questions about our privacy policy.</p>',

  // Profile Page
  'logout': 'Logout',
  'account': 'Account',

  // Blog Page
  'Blog': 'Blog',
  'Bir hata oluştu.': 'An error occurred.',
  'Blog yazısı bulunamadı.': 'No blog posts found.',
  'Şuan blog yok': 'No blogs available',
  'pills': 'Pills',
  'health': 'Health',
  'lifeStyle': 'Life Style',

  // Introduction Page
  "introduction.page1.title":
      "Take Your Medicine on Time, Keep Your Health Safe",
  "introduction.page1.description":
      "It's easy to forget medication times in the hustle of life. With our app, you won't miss any doses anymore. Set your medicine, time, and duration – we'll remind you on time.",
  "introduction.page1.tip": "Health begins with a dose of care taken on time.",

  "introduction.page2.title": "Track Your Health, Stay Informed",
  "introduction.page2.description":
      "We not only remind you but also provide useful information about your health. Strengthen your daily health habits with expert-supported blog posts.",
  "introduction.page2.tip":
      "A small piece of information can make a big difference.",

  "introduction.page3.title": "Open to the World, Personalized for You",
  "introduction.page3.description":
      "Our app is accessible to everyone with support for 16 languages. With its easy-to-use interface, add your medicine with just a few taps and make your life easier.",
  "introduction.page3.tip": "Health is universal, and so are we.",

  "introduction.back": "Back",
  "introduction.start": "Start",

  // Register Page
  "register.register_to_medreminder_app": "Register to Amina Dose app",
  "register.already_have_an_account": "Already have an account? ",
  "register.sign_in": "Sign in",
  "register.full_name": "Your full name",
  "register.surname": "Your surname",
  "register.your_email": "Your email",
  "register.type_your_password": "Type your password",
  "register.re_type_your_password": "Re-type your password",
  "register.register": "Register",
  "register.fill_all_fields": "Please fill all fields",
  "register.password_not_match": "Passwords don't match",
  "register.error_occurred": "An error occurred",

  // Login Page
  "login.invalid_email": "Invalid email address",
  "login.user_disabled": "User has been disabled",
  "login.email_already_in_use": "This email address is already in use",
  "login.wrong_password": "The information you entered is incorrect",
  "login.email_not_verified": "Please verify your email address first",
  "login.operation_not_allowed": "This operation is not allowed",
  "login.error_occurred": "An error occurred",
  "login.error_occured_google":
      "An error occurred while signing in with Google",
  "login.please_enter_your_email": "Please enter your email address",
  "login.password_reset_email_sent": "Password reset email sent",
  "login.login_into_your_account": "Login into your account",
  "login.dont_have_an_account": "Don't have an account? ",
  "login.sign_up": "Sign up",
  "login.your_email": "Your email",
  "login.type_your_password": "Type your password",
  "login.login": "Login",
  "login.forgot_password": "Forgot your password?",
  "login.or": "or",
  "login.login_with_google": "Login with Google",

  // Menu Page
  "menu.myMedicines": "My Medicines",
  "menu.addMedicine": "Add Medicine",
  "menu.blogs": "Blogs",
  "menu.profile": "Profile",

  'time_for_medicine': 'Time for your medicine!',
  'take_medicine_now': 'Take your {dosageInfo} of {medicineName} now.',
};
