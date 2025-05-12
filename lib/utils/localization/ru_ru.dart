// lib/utils/localization/ru_ru.dart

const Map<String, String> ruRU = {
  // General
  'general.appTitle': 'Напоминание о лекарствах',
  'general.save': 'Сохранить',
  'general.cancel': 'Отмена',
  'general.delete': 'Удалить',
  'general.edit': 'Редактировать',
  'general.add': 'Добавить',
  'general.confirm': 'Подтвердить',
  'general.success': 'Успешно',
  'general.error': 'Ошибка',
  'general.loading': 'Загрузка...',
  'general.requiredField': 'Это поле обязательно к заполнению',
  'general.done': 'Готово',

  // Auth
  'auth.login': 'Вход',
  'auth.signup': 'Регистрация',
  'auth.logout': 'Выход',
  'auth.email': 'Электронная почта',
  'auth.password': 'Пароль',
  'auth.loginButton': 'Войти',
  'auth.signupButton': 'Зарегистрироваться',
  'auth.loginErrorTitle': 'Ошибка входа',
  'auth.signupErrorTitle': 'Ошибка регистрации',
  'auth.unknownError': 'Произошла неизвестная ошибка.',
  'auth.or': 'ИЛИ',
  'auth.noAccount': 'Нет аккаунта? Зарегистрируйтесь',
  'auth.haveAccount': 'Уже есть аккаунт? Войдите',

  // Home / Medicine List
  'home.title': 'Мои лекарства',
  'home.addMedicine': 'Добавить новое лекарство',
  'home.noMedicines': 'Лекарства еще не добавлены. Нажмите +, чтобы добавить!',
  'home.confirmDeleteTitle': 'Удалить лекарство',
  'home.confirmDeleteContent': 'Вы уверены, что хотите удалить {medicineName}?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': 'Добавить лекарство',
  'addMedicine.titleEdit': 'Редактировать лекарство',
  'addMedicine.nameLabel': 'Название лекарства',
  'addMedicine.nameHint': 'например, Парацетамол',
  'addMedicine.typeLabel': 'Тип/Категория лекарства',
  'addMedicine.typeHint': 'например, Таблетки, Сироп, Инъекция',
  'addMedicine.dosageLabel': 'Количество дозы',
  'addMedicine.dosageHint': 'например, 1, 2, 500',
  'addMedicine.dosageUnitLabel': 'Единица дозы',
  'addMedicine.dosageUnitHint': 'например, таблетки, мл, мг',
  'addMedicine.frequencyLabel': 'Частота',
  'addMedicine.frequencyHint': 'например, Ежедневно, Дважды в день',
  'addMedicine.durationLabel': 'Продолжительность (дни)',
  'addMedicine.durationHint': 'например, 7, 14, 30 (0 для постоянного приема)',
  'addMedicine.whenToTakeLabel': 'Когда принимать / Примечания',
  'addMedicine.whenToTakeHint': 'например, С едой, Перед сном',
  'addMedicine.startDateLabel': 'Дата начала',
  'addMedicine.endDateLabel': 'Дата окончания (необязательно)',
  'addMedicine.selectDate': 'Выбрать дату',
  'addMedicine.selectTime': 'Выбрать время',
  'addMedicine.timesLabel': 'Раз в день',
  'addMedicine.addTime': 'Добавить время',
  'addMedicine.notesLabel': 'Дополнительные примечания (необязательно)',
  'addMedicine.notesHint': 'например, Хранить в прохладном месте',
  'addMedicine.enableNotificationsLabel': 'Включить напоминания о дозах',
  'addMedicine.errorNumeric': 'Пожалуйста, введите действительное число',
  'addMedicine.addMedicine': 'Добавить лекарство',
  'addMedicine.save': 'Сохранить',
  'addMedicine.name': 'Название лекарства',
  'addMedicine.addMedicineHint': 'Название лекарства (например, Парацетамол)',
  'addMedicine.dosage': 'Дозировка',
  'addMedicine.dosageHint2': 'Количество (например, 500)',
  'addMedicine.dosageUnit': 'Единица (например, мг)',
  'addMedicine.category': 'Категория',
  'addMedicine.frequency': 'Частота и продолжительность',
  'addMedicine.selectDoseTimes': 'Выбрать время дозы',
  'addMedicine.times': 'раз(а) выбрано',
  'addMedicine.selectDuration': 'Выбрать продолжительность',
  'addMedicine.days': 'день(дней)',
  'addMedicine.whenToTake': 'Когда принимать',
  'addMedicine.beforeFood': 'До еды',
  'addMedicine.afterFood': 'После еды',
  'addMedicine.notifications': 'Уведомления',
  'addMedicine.enableNotifications': 'Включить напоминания о дозах',
  'addMedicine.receiveNotification':
      'Получать уведомление за 5 минут до каждой дозы',
  'addMedicine.doseTimesPickerTitle': 'Выбрать время дозы',
  'addMedicine.done': 'Готово',

  // Medicine Controller Messages
  'medicine.addSuccess': 'Лекарство успешно добавлено.',
  'medicine.updateSuccess': 'Лекарство успешно обновлено.',
  'medicine.deleteSuccess': 'Лекарство успешно удалено.',
  'medicine.errorNeedTime': 'Пожалуйста, выберите хотя бы одно время.',
  'medicine.saveMedicineSuccess': 'Лекарство успешно сохранено.',
  'medicine.saveMedicineError': 'Ошибка',
  'medicine.saveMedicineErrorMessage': 'Не удалось сохранить лекарство: {e}',
  'medicine.updateMedicineSuccess': 'Лекарство успешно обновлено.',
  'medicine.updateMedicineError': 'Ошибка',
  'medicine.updateMedicineErrorMessage': 'Не удалось обновить лекарство: {e}',
  'medicine.deleteMedicineSuccess': 'Лекарство успешно удалено.',
  'medicine.deleteMedicineError': 'Ошибка',
  'medicine.deleteMedicineErrorMessage': 'Не удалось удалить лекарство: {e}',
  'medicine.withFood': 'С едой',
  'medicine.deleteMedicineSuccessMessage': 'Лекарство успешно удалено.',
  'medicine.saveMedicineSuccessMessage': 'Лекарство успешно сохранено.',

  // Settings Page
  'settings.title': 'Настройки',
  'settings.language': 'Язык',
  'settings.selectLanguage': 'Выбрать язык',
  'settings.profile': 'Профиль',

  // Introduction Screen
  'introduction.skip': 'Пропустить',
  'introduction.done': 'Готово',
  'introduction.next': 'Далее',

  // Filter
  'filter.allTypes': 'Все типы',
  'filter.uncategorized': 'Без категории',
  'filter.searchHint': 'Поиск лекарств...',
  'filter.noResultsForSearchAndType':
      'Нет результатов для \"{query}\" в {type}',
  'filter.noResultsForSearch': 'Нет результатов для \"{query}\"',
  'filter.noResultsForType': 'Нет результатов для типа \"{type}\"',

  // Medicine Card
  'card.treatmentCompleted': 'Лечение завершено',
  'card.nextDoseN_A': 'Следующая доза: Н/Д',
  'card.todayAt': 'Сегодня в',
  'card.tomorrowAt': 'Завтра в',
  'card.at': 'в',
  'card.nextDose': 'Следующая доза:',
  'card.frequency.onceDaily': 'Один раз в день',
  'card.frequency.twiceDaily': 'Два раза в день',
  'card.frequency.thriceDaily': 'Три раза в день',
  'card.frequency.timesDaily': '{count} раз(а) в день',
  'addMedicine.nameLabelText': 'Название',
  'addMedicine.dosageLabelText': 'Дозировка',
  'addMedicine.dosageQuantityHint': 'Количество (например, 500)',
  'addMedicine.categoryLabel': 'Категория',
  'addMedicine.frequencyDurationLabel': 'Частота и продолжительность',
  'addMedicine.selectDoseTimesPlaceholder': 'Выбрать время дозы',
  'addMedicine.doseTimesBottomSheetTitle': 'Выбрать время дозы',
  'addMedicine.timesSelectedInfo': '{count} время(времени) выбрано',
  'addMedicine.selectDurationPlaceholder': 'Выбрать продолжительность',
  'addMedicine.durationSelectedInfo': '{count} день(дней)',
  'addMedicine.whenToTakeLabelText': 'Когда принимать',
  'addMedicine.beforeFoodOption': 'До еды',
  'addMedicine.afterFoodOption': 'После еды',
  'addMedicine.notificationsSectionLabel': 'Уведомления',
  'addMedicine.notificationSubtext':
      'Получать уведомление за 5 минут до каждой дозы',
  'addMedicine.durationPickerTitle': 'Выбрать продолжительность (в днях)',
  'addMedicine.durationPickerItemText': '{days} день(дней)',
  'addMedicine.timesSelected': 'раз(а) выбрано',
  'addMedicine.notificationsLabel': 'Уведомления',
  'addMedicine.enableDoseReminders': 'Включить напоминания о дозах',
  'addMedicine.remindersSubtext':
      'Получать уведомление за 5 минут до каждой дозы',

  // Profile Page
  'personal_info': 'Личная информация',
  'preferences': 'Предпочтения',
  'about_app': 'О приложении',
  'app_version': 'Версия приложения',
  'privacy_policy': 'Политика конфиденциальности',
  'developer': 'Разработчик: Фуркан Акиф Ислек',
  'noEmail': 'Электронная почта не найдена',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'Удалить аккаунт',
  'profile.deleteAccountImportantText':
      'Вы уверены, что хотите удалить свой аккаунт? Это действие нельзя отменить.',
  'profile.cancel': 'Отмена',
  'profile.delete': 'Удалить',
  'profile.errorDeletingAccount': 'Ошибка при удалении аккаунта',
  'profile.deleteAccountButton': 'Удалить аккаунт',

  // Profile Page
  'logout': 'Выйти',
  'account': 'Аккаунт',

  // Blog Page
  'Blog': 'Блог',
  'Bir hata oluştu.': 'Произошла ошибка.',
  'Blog yazısı bulunamadı.': 'Записей блога не найдено.',
  'Şuan blog yok': 'Нет доступных блогов',
  'pills': 'Таблетки',
  'health': 'Здоровье',
  'lifeStyle': 'Образ жизни',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>Напоминание о приёме лекарств - Политика конфиденциальности</h3><br><p><b>Использование личной информации:</b><br>Наше приложение обязуется защищать конфиденциальность наших пользователей. В нашем приложении для напоминания о приеме лекарств мы собираем необходимую информацию (электронная почта, информация о профиле и планы приема лекарств) для отслеживания лекарств и напоминаний. Эта информация используется для предоставления и улучшения нашего сервиса и не передается третьим лицам.</p><br><p><b>Хранение и безопасность данных:</b><br>Ваши пользовательские данные хранятся на защищенных серверах в зашифрованном формате. Ваша информация о лекарствах и личные данные защищены надежными мерами безопасности. Только необходимый персонал имеет доступ к вашим данным.</p><br><p><b>Права пользователей:</b><br>Пользователи имеют право просматривать, редактировать или удалять свои учетные записи и данные в любое время. Когда вы удаляете свою учетную запись, все ваши данные навсегда удаляются из нашей системы.</p><br><p><b>Файлы cookie и отслеживание:</b><br>Наше приложение может использовать файлы cookie для улучшения пользовательского опыта. Эти файлы cookie хранят пользовательские предпочтения и данные об использовании приложения. Вы можете отключить файлы cookie в настройках браузера, если хотите.</p><br><p><b>Уведомления:</b><br>Наше приложение отправляет уведомления только для напоминаний о приеме лекарств, одобренных пользователем. Вы не будете получать нежелательные уведомления и можете отключить уведомления в разделе настроек.</p><br><p><b>Изменения:</b><br>Наша политика конфиденциальности может время от времени обновляться. Пользователи будут уведомлены, когда произойдут существенные изменения. Используя наше приложение, вы соглашаетесь с этими условиями.</p><br><p><b>Контакт:</b><br>Пожалуйста, свяжитесь с нами с любыми вопросами о нашей политике конфиденциальности.</p>',

  // Introduction Page
  "introduction.page1.title":
      "Принимайте Лекарства Вовремя, Берегите Своё Здоровье",
  "introduction.page1.description":
      "В суете жизни легко забыть о времени приёма лекарств. С нашим приложением вы больше не пропустите ни одной дозы. Установите своё лекарство, время и продолжительность – мы напомним вам вовремя.",
  "introduction.page1.tip":
      "Здоровье начинается с дозы заботы, принятой вовремя.",

  "introduction.page2.title":
      "Следите за Своим Здоровьем, Будьте Информированы",
  "introduction.page2.description":
      "Мы не только напоминаем вам, но и предоставляем полезную информацию о вашем здоровье. Укрепляйте свои ежедневные привычки здоровья с помощью экспертных блогов.",
  "introduction.page2.tip":
      "Небольшая информация может иметь большое значение.",

  "introduction.page3.title": "Открыт Миру, Персонализирован для Вас",
  "introduction.page3.description":
      "Наше приложение доступно всем с поддержкой 16 языков. С его простым интерфейсом добавляйте свои лекарства всего несколькими касаниями и упрощайте свою жизнь.",
  "introduction.page3.tip": "Здоровье универсально, и мы тоже.",

  "introduction.back": "Назад",
  "introduction.start": "Начать",

  // Register Page
  "register.register_to_medreminder_app":
      "Регистрация в приложении Medreminder",
  "register.already_have_an_account": "Уже есть аккаунт? ",
  "register.sign_in": "Войти",
  "register.full_name": "Ваше полное имя",
  "register.surname": "Ваша фамилия",
  "register.your_email": "Ваш email",
  "register.type_your_password": "Введите ваш пароль",
  "register.re_type_your_password": "Повторите ваш пароль",
  "register.register": "Зарегистрироваться",
  "register.fill_all_fields": "Пожалуйста, заполните все поля",
  "register.password_not_match": "Пароли не совпадают",
  "register.error_occurred": "Произошла ошибка",

  // Login Page
  "login.invalid_email": "Недействительный адрес электронной почты",
  "login.user_disabled": "Пользователь отключен",
  "login.email_already_in_use": "Этот адрес электронной почты уже используется",
  "login.wrong_password": "Введенная информация неверна",
  "login.email_not_verified":
      "Пожалуйста, сначала подтвердите свой адрес электронной почты",
  "login.operation_not_allowed": "Эта операция не разрешена",
  "login.error_occurred": "Произошла ошибка",
  "login.error_occured_google": "Произошла ошибка при входе через Google",
  "login.please_enter_your_email":
      "Пожалуйста, введите свой адрес электронной почты",
  "login.password_reset_email_sent": "Письмо для сброса пароля отправлено",
  "login.login_into_your_account": "Войдите в свой аккаунт",
  "login.dont_have_an_account": "Нет аккаунта? ",
  "login.sign_up": "Зарегистрироваться",
  "login.your_email": "Ваш email",
  "login.type_your_password": "Введите ваш пароль",
  "login.login": "Войти",
  "login.forgot_password": "Забыли пароль?",
  "login.or": "или",
  "login.login_with_google": "Войти через Google",
};
