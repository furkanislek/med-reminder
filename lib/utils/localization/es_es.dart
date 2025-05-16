// lib/utils/localization/es_es.dart

const Map<String, String> esES = {
  // General
  'general.appTitle': 'Recordatorio de Medicamentos',
  'general.save': 'Guardar',
  'general.cancel': 'Cancelar',
  'general.delete': 'Eliminar',
  'general.edit': 'Editar',
  'general.add': 'Añadir',
  'general.confirm': 'Confirmar',
  'general.success': 'Éxito',
  'general.error': 'Error',
  'general.loading': 'Cargando...',
  'general.requiredField': 'Este campo es obligatorio',
  'general.done': 'Hecho',

  // Auth
  'auth.login': 'Iniciar Sesión',
  'auth.signup': 'Registrarse',
  'auth.logout': 'Cerrar Sesión',
  'auth.email': 'Correo electrónico',
  'auth.password': 'Contraseña',
  'auth.loginButton': 'Iniciar Sesión',
  'auth.signupButton': 'Registrarse',
  'auth.loginErrorTitle': 'Error de inicio de sesión',
  'auth.signupErrorTitle': 'Error de registro',
  'auth.unknownError': 'Ha ocurrido un error desconocido.',
  'auth.or': 'O',
  'auth.noAccount': '¿No tienes una cuenta? Regístrate',
  'auth.haveAccount': '¿Ya tienes una cuenta? Inicia sesión',
  'auth.checkEmail': 'Revisa tu correo electrónico',
  'auth.resetPasswordInfo':
      'Te hemos enviado información\n para restablecer tu contraseña',
  'auth.registerSuccessInfo':
      'Registro exitoso. Por favor confirma tu cuenta\n con el enlace enviado a tu dirección de correo electrónico.',
  'auth.resetPassword': 'Restablecer contraseña',
  'auth.resetPasswordInstructions':
      'Ingresa tu dirección de correo electrónico y te enviaremos instrucciones para restablecer tu contraseña.',
  'auth.yourEmail': 'Tu correo electrónico',
  'auth.resetButton': 'Restablecer Contraseña',
  'auth.emailRequired': 'Por favor ingresa tu dirección de correo electrónico.',

  // Home / Medicine List
  'home.title': 'Mis Medicamentos',
  'home.addMedicine': 'Añadir Nuevo Medicamento',
  'home.noMedicines':
      'Aún no hay medicamentos añadidos. ¡Pulsa + para añadir uno!',
  'home.confirmDeleteTitle': 'Eliminar Medicamento',
  'home.confirmDeleteContent':
      '¿Estás seguro de que quieres eliminar {medicineName}?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'Añadir Medicamento',
  'addMedicine.titleEdit': 'Editar Medicamento',
  'addMedicine.nameLabel': 'Nombre del Medicamento',
  'addMedicine.nameHint': 'ej. Paracetamol',
  'addMedicine.typeLabel': 'Tipo/Categoría del Medicamento',
  'addMedicine.typeHint': 'ej. Píldora, Jarabe, Inyección',
  'addMedicine.dosageLabel': 'Cantidad de Dosis',
  'addMedicine.dosageHint': 'ej. 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'Unidad de Dosis',
  'addMedicine.dosageUnitHint': 'ej. comprimido, mL, mg',
  'addMedicine.frequencyLabel': 'Frecuencia',
  'addMedicine.frequencyHint': 'ej. Diario, Dos veces al día',
  'addMedicine.durationLabel': 'Duración (días)',
  'addMedicine.durationHint': 'ej. 7, 14, 30 (0 para continuo)',
  'addMedicine.whenToTakeLabel': 'Cuándo Tomar / Notas',
  'addMedicine.whenToTakeHint': 'ej. Con comida, Antes de dormir',
  'addMedicine.startDateLabel': 'Fecha de Inicio',
  'addMedicine.endDateLabel': 'Fecha de Fin (Opcional)',
  'addMedicine.selectDate': 'Seleccionar Fecha',
  'addMedicine.selectTime': 'Seleccionar Hora',
  'addMedicine.timesLabel': 'Veces al Día',
  'addMedicine.addTime': 'Añadir Hora',
  'addMedicine.notesLabel': 'Notas Adicionales (Opcional)',
  'addMedicine.notesHint': 'ej. Guardar en lugar fresco',
  'addMedicine.enableNotificationsLabel': 'Activar Recordatorios de Dosis',
  'addMedicine.errorNumeric': 'Por favor, introduce un número válido',
  'addMedicine.addMedicine': 'Añadir Medicamento',
  'addMedicine.save': 'Guardar',
  'addMedicine.name': 'Nombre del Medicamento',
  'addMedicine.addMedicineHint': 'Nombre del Medicamento (ej. Paracetamol)',
  'addMedicine.dosage': 'Dosis',
  'addMedicine.dosageHint2': 'Cantidad (ej. 500)',
  'addMedicine.dosageUnit': 'Unidad (ej. mg)',
  'addMedicine.category': 'Categoría',
  'addMedicine.frequency': 'Frecuencia & Duración',
  'addMedicine.selectDoseTimes': 'Seleccionar Horas de Dosis',
  'addMedicine.times': 'vez/veces seleccionada(s)',
  'addMedicine.selectDuration': 'Seleccionar Duración',
  'addMedicine.days': 'día(s)',
  'addMedicine.whenToTake': 'Cuándo Tomar',
  'addMedicine.beforeFood': 'Antes de Comer',
  'addMedicine.afterFood': 'Después de Comer',
  'addMedicine.notifications': 'Notificaciones',
  'addMedicine.enableNotifications': 'Activar Recordatorios de Dosis',
  'addMedicine.receiveNotification':
      'Recibir una notificación 5 minutos antes de cada dosis',
  'addMedicine.doseTimesPickerTitle': 'Seleccionar Horas de Dosis',
  'addMedicine.done': 'Hecho',
  'addMedicine.deleteMedicine': 'Eliminar Medicamento',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Medicamento añadido correctamente.',
  'medicine.updateSuccess': 'Medicamento actualizado correctamente.',
  'medicine.deleteSuccess': 'Medicamento eliminado correctamente.',
  'medicine.errorNeedTime': 'Por favor, selecciona al menos una hora.',
  'medicine.saveMedicineSuccess': 'Medicamento guardado correctamente.',
  'medicine.saveMedicineError': 'Error',
  'medicine.saveMedicineErrorMessage': 'Error al guardar el medicamento: {e}',
  'medicine.updateMedicineSuccess': 'Medicamento actualizado correctamente.',
  'medicine.updateMedicineError': 'Error',
  'medicine.updateMedicineErrorMessage':
      'Error al actualizar el medicamento: {e}',
  'medicine.deleteMedicineSuccess': 'Medicamento eliminado correctamente.',
  'medicine.deleteMedicineError': 'Error',
  'medicine.deleteMedicineErrorMessage':
      'Error al eliminar el medicamento: {e}',
  'medicine.withFood': 'Con Comida',
  'medicine.deleteMedicineSuccessMessage': 'Medicamento eliminado con éxito.',
  'medicine.saveMedicineSuccessMessage': 'Medicamento guardado con éxito.',

  // Settings Page
  'settings.title': 'Ajustes',
  'settings.language': 'Idioma',
  'settings.selectLanguage': 'Seleccionar Idioma',
  'settings.profile': 'Perfil',

  // Introduction Screen
  'introduction.skip': 'Omitir',
  'introduction.done': 'Hecho',
  'introduction.next': 'Siguiente',

  // Filter
  'filter.allTypes': 'Todos los Tipos',
  'filter.uncategorized': 'Sin Categoría',
  'filter.searchHint': 'Buscar Medicamentos...',
  'filter.noResultsForSearchAndType':
      'No hay resultados para "{query}" en {type}',
  'filter.noResultsForSearch': 'No hay resultados para "{query}"',
  'filter.noResultsForType': 'No hay resultados para el tipo "{type}"',

  // Medicine Card
  'card.treatmentCompleted': 'Tratamiento Completado',
  'card.nextDoseN_A': 'Próxima dosis: N/A',
  'card.todayAt': 'Hoy a las',
  'card.tomorrowAt': 'Mañana a las',
  'card.at': 'a las',
  'card.nextDose': 'Próxima dosis:',
  'card.frequency.onceDaily': 'Una vez al día',
  'card.frequency.twiceDaily': 'Dos veces al día',
  'card.frequency.thriceDaily': 'Tres veces al día',
  'card.frequency.timesDaily': '{count} veces al día',
  'addMedicine.nameLabelText': 'Nombre',
  'addMedicine.dosageLabelText': 'Dosis',
  'addMedicine.dosageQuantityHint': 'Cantidad (ej. 500)',
  'addMedicine.categoryLabel': 'Categoría',
  'addMedicine.frequencyDurationLabel': 'Frecuencia & Duración',
  'addMedicine.selectDoseTimesPlaceholder': 'Seleccionar Horas de Dosis',
  'addMedicine.doseTimesBottomSheetTitle': 'Seleccionar Horas de Dosis',
  'addMedicine.timesSelectedInfo': '{count} hora(s) seleccionada(s)',
  'addMedicine.selectDurationPlaceholder': 'Seleccionar Duración',
  'addMedicine.durationSelectedInfo': '{count} día(s)',
  'addMedicine.whenToTakeLabelText': 'Cuándo Tomar',
  'addMedicine.beforeFoodOption': 'Antes de Comer',
  'addMedicine.afterFoodOption': 'Después de Comer',
  'addMedicine.notificationsSectionLabel': 'Notificaciones',
  'addMedicine.notificationSubtext':
      'Recibir una notificación 5 minutos antes de cada dosis',
  'addMedicine.durationPickerTitle': 'Seleccionar Duración (en días)',
  'addMedicine.durationPickerItemText': '{days} día(s)',
  'addMedicine.timesSelected': 'veces seleccionadas',
  'addMedicine.notificationsLabel': 'Notificaciones',
  'addMedicine.enableDoseReminders': 'Activar Recordatorios de Dosis',
  'addMedicine.remindersSubtext':
      'Recibir una notificación 5 minutos antes de cada dosis',

  // Profile Page
  'personal_info': 'Información Personal',
  'preferences': 'Preferencias',
  'about_app': 'Acerca de la Aplicación',
  'app_version': 'Versión de la Aplicación',
  'privacy_policy': 'Política de Privacidad',
  'developer': 'Desarrollador: Furkan Akif ISLEK',
  'noEmail': 'No se encontró correo electrónico',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'Eliminar Cuenta',
  'profile.deleteAccountImportantText':
      '¿Estás seguro de que quieres eliminar tu cuenta? Esta acción no se puede deshacer.',
  'profile.cancel': 'Cancelar',
  'profile.delete': 'Eliminar',
  'profile.errorDeletingAccount': 'Error al eliminar la cuenta',
  'profile.deleteAccountButton': 'Eliminar Cuenta',

  // Profile Page
  'logout': 'Cerrar sesión',
  'account': 'Cuenta',

  // Blog Page
  'Blog': 'Blog',
  'Bir hata oluştu.': 'Ha ocurrido un error.',
  'Blog yazısı bulunamadı.': 'No se encontraron publicaciones de blog.',
  'Şuan blog yok': 'No hay blogs disponibles',
  'pills': 'Píldoras',
  'health': 'Salud',
  'lifeStyle': 'Estilo de vida',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>Recordatorio de Medicamentos - Política de Privacidad</h3><br><p><b>Uso de Información Personal:</b><br>Nuestra aplicación se compromete a proteger la privacidad de nuestros usuarios. En nuestra aplicación de recordatorio de medicamentos, recopilamos información necesaria (correo electrónico, información de perfil y planes de medicación) para el seguimiento de medicamentos y recordatorios. Esta información se utiliza para proporcionar y mejorar nuestro servicio y no se comparte con terceros.</p><br><p><b>Almacenamiento y Seguridad de Datos:</b><br>Sus datos de usuario se almacenan en servidores seguros en formato encriptado. Su información de medicamentos y datos personales están protegidos bajo fuertes medidas de seguridad. Solo el personal necesario puede acceder a sus datos.</p><br><p><b>Derechos del Usuario:</b><br>Los usuarios tienen derecho a ver, editar o eliminar sus cuentas y datos en cualquier momento. Cuando elimina su cuenta, todos sus datos se eliminan permanentemente de nuestro sistema.</p><br><p><b>Cookies y Seguimiento:</b><br>Nuestra aplicación puede usar cookies para mejorar la experiencia del usuario. Estas cookies almacenan preferencias de usuario y datos de uso de la aplicación. Puede desactivar las cookies desde la configuración de su navegador si lo desea.</p><br><p><b>Notificaciones:</b><br>Nuestra aplicación solo envía notificaciones para recordatorios de medicamentos aprobados por el usuario. No recibirá notificaciones no deseadas y puede desactivar las notificaciones desde la sección de configuración.</p><br><p><b>Cambios:</b><br>Nuestra política de privacidad puede actualizarse de vez en cuando. Los usuarios serán notificados cuando haya cambios significativos. Al usar nuestra aplicación, acepta estos términos.</p><br><p><b>Contacto:</b><br>Por favor, contáctenos con cualquier pregunta sobre nuestra política de privacidad.</p>',

  // Introduction Page
  "introduction.page1.title":
      "Toma Tu Medicina a Tiempo, Mantén Tu Salud Segura",
  "introduction.page1.description":
      "Es fácil olvidar los horarios de medicación en el ajetreo de la vida. Con nuestra aplicación, ya no te perderás ninguna dosis. Configura tu medicina, hora y duración – te lo recordaremos a tiempo.",
  "introduction.page1.tip":
      "La salud comienza con una dosis de cuidado tomada a tiempo.",

  "introduction.page2.title": "Controla Tu Salud, Mantente Informado",
  "introduction.page2.description":
      "No solo te recordamos, también te proporcionamos información útil sobre tu salud. Fortalece tus hábitos diarios de salud con publicaciones de blog respaldadas por expertos.",
  "introduction.page2.tip":
      "Un pequeño trozo de información puede marcar una gran diferencia.",

  "introduction.page3.title": "Abierto al Mundo, Personalizado para Ti",
  "introduction.page3.description":
      "Nuestra aplicación es accesible para todos con soporte para 16 idiomas. Con su interfaz fácil de usar, añade tu medicina con solo unos toques y haz tu vida más fácil.",
  "introduction.page3.tip":
      "La salud es universal, y nosotros también lo somos.",

  "introduction.back": "Atrás",
  "introduction.start": "Comenzar",

  // Register Page
  "register.register_to_medreminder_app":
      "Regístrate en la aplicación Medreminder",
  "register.already_have_an_account": "¿Ya tienes una cuenta? ",
  "register.sign_in": "Iniciar sesión",
  "register.full_name": "Tu nombre completo",
  "register.surname": "Tu apellido",
  "register.your_email": "Tu correo electrónico",
  "register.type_your_password": "Escribe tu contraseña",
  "register.re_type_your_password": "Vuelve a escribir tu contraseña",
  "register.register": "Registrarse",
  "register.fill_all_fields": "Por favor, completa todos los campos",
  "register.password_not_match": "Las contraseñas no coinciden",
  "register.error_occurred": "Ha ocurrido un error",

  // Login Page
  "login.invalid_email": "Dirección de correo electrónico inválida",
  "login.user_disabled": "El usuario ha sido deshabilitado",
  "login.email_already_in_use":
      "Esta dirección de correo electrónico ya está en uso",
  "login.wrong_password": "La información que has introducido es incorrecta",
  "login.email_not_verified":
      "Por favor, verifica primero tu dirección de correo electrónico",
  "login.operation_not_allowed": "Esta operación no está permitida",
  "login.error_occurred": "Ha ocurrido un error",
  "login.error_occured_google":
      "Ha ocurrido un error al iniciar sesión con Google",
  "login.please_enter_your_email":
      "Por favor, introduce tu dirección de correo electrónico",
  "login.password_reset_email_sent":
      "Correo de restablecimiento de contraseña enviado",
  "login.login_into_your_account": "Inicia sesión en tu cuenta",
  "login.dont_have_an_account": "¿No tienes una cuenta? ",
  "login.sign_up": "Regístrate",
  "login.your_email": "Tu correo electrónico",
  "login.type_your_password": "Escribe tu contraseña",
  "login.login": "Iniciar sesión",
  "login.forgot_password": "¿Olvidaste tu contraseña?",
  "login.or": "o",
  "login.login_with_google": "Iniciar sesión con Google",

  // Menu Page
  "menu.myMedicines": "Mis Medicamentos",
  "menu.addMedicine": "Añadir Medicamento",
  "menu.blogs": "Blog",
  "menu.profile": "Perfil",

  'time_for_medicine': '¡Es hora de tu medicamento!',
  'take_medicine_now': 'Toma {dosageInfo} de {medicineName} ahora.',
};
