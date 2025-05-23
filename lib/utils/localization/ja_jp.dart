// lib/utils/localization/ja_jp.dart

const Map<String, String> jaJP = {
  // General
  'general.appTitle': '薬リマインダー',
  'general.save': '保存',
  'general.cancel': 'キャンセル',
  'general.delete': '削除',
  'general.edit': '編集',
  'general.add': '追加',
  'general.confirm': '確認',
  'general.success': '成功',
  'general.error': 'エラー',
  'general.loading': '読み込み中...',
  'general.requiredField': 'この項目は必須です',
  'general.done': '完了',

  // Auth
  'auth.login': 'ログイン',
  'auth.signup': '新規登録',
  'auth.logout': 'ログアウト',
  'auth.email': 'メールアドレス',
  'auth.password': 'パスワード',
  'auth.loginButton': 'ログイン',
  'auth.signupButton': '登録',
  'auth.loginErrorTitle': 'ログイン失敗',
  'auth.signupErrorTitle': '登録失敗',
  'auth.unknownError': '不明なエラーが発生しました。',
  'auth.or': 'または',
  'auth.noAccount': 'アカウントをお持ちでない方は登録してください',
  'auth.haveAccount': 'すでにアカウントをお持ちの方はログインしてください',
  'auth.checkEmail': 'メールをご確認ください',
  'auth.resetPasswordInfo': 'パスワードをリセットするための\n情報を送信しました',
  'auth.registerSuccessInfo': '登録に成功しました。メールアドレスに送信された\nリンクでアカウントを確認してください。',
  'auth.resetPassword': 'パスワードのリセット',
  'auth.resetPasswordInstructions':
      'メールアドレスを入力してください。パスワードをリセットする方法についての詳細な手順をお送りします。',
  'auth.yourEmail': 'あなたのメール',
  'auth.resetButton': 'パスワードをリセット',
  'auth.emailRequired': 'メールアドレスを入力してください。',

  // Home / Medicine List
  'home.title': '私の薬',
  'home.addMedicine': '新しい薬を追加',
  'home.noMedicines': 'まだ薬が追加されていません。+をタップして追加してください！',
  'home.confirmDeleteTitle': '薬を削除',
  'home.confirmDeleteContent': '本当に{medicineName}を削除しますか？',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': '薬を追加',
  'addMedicine.titleEdit': '薬を編集',
  'addMedicine.nameLabel': '薬の名前',
  'addMedicine.nameHint': '例：パラセタモール',
  'addMedicine.typeLabel': '薬のタイプ/カテゴリー',
  'addMedicine.typeHint': '例：錠剤、シロップ、注射',
  'addMedicine.dosageLabel': '用量の量',
  'addMedicine.dosageHint': '例：1、2、500',
  'addMedicine.dosageUnitLabel': '用量の単位',
  'addMedicine.dosageUnitHint': '例：錠、mL、mg',
  'addMedicine.frequencyLabel': '頻度',
  'addMedicine.frequencyHint': '例：毎日、1日2回',
  'addMedicine.durationLabel': '期間（日数）',
  'addMedicine.durationHint': '例：7、14、30（継続的な場合は0）',
  'addMedicine.whenToTakeLabel': '服用タイミング/メモ',
  'addMedicine.whenToTakeHint': '例：食事と一緒に、就寝前',
  'addMedicine.startDateLabel': '開始日',
  'addMedicine.endDateLabel': '終了日（任意）',
  'addMedicine.selectDate': '日付を選択',
  'addMedicine.selectTime': '時間を選択',
  'addMedicine.timesLabel': '1日あたりの回数',
  'addMedicine.addTime': '時間を追加',
  'addMedicine.notesLabel': '追加メモ（任意）',
  'addMedicine.notesHint': '例：涼しい場所に保管',
  'addMedicine.enableNotificationsLabel': '服用リマインダーを有効にする',
  'addMedicine.errorNumeric': '有効な数字を入力してください',
  'addMedicine.addMedicine': '薬を追加',
  'addMedicine.save': '保存',
  'addMedicine.name': '薬の名前',
  'addMedicine.addMedicineHint': '薬の名前（例：パラセタモール）',
  'addMedicine.dosage': '用量',
  'addMedicine.dosageHint2': '量（例：500）',
  'addMedicine.dosageUnit': '単位（例：mg）',
  'addMedicine.category': 'カテゴリー',
  'addMedicine.frequency': '頻度と期間',
  'addMedicine.selectDoseTimes': '服用時間を選択',
  'addMedicine.times': '回選択済み',
  'addMedicine.selectDuration': '期間を選択',
  'addMedicine.days': '日',
  'addMedicine.whenToTake': '服用タイミング',
  'addMedicine.beforeFood': '食前',
  'addMedicine.afterFood': '食後',
  'addMedicine.notifications': '通知',
  'addMedicine.enableNotifications': '服用リマインダーを有効にする',
  'addMedicine.receiveNotification': '各服用の5分前に通知を受け取る',
  'addMedicine.doseTimesPickerTitle': '服用時間を選択',
  'addMedicine.done': '完了',
  'addMedicine.deleteMedicine': '薬を削除',

  // Medicine Controller Messages
  'medicine.addSuccess': '薬が正常に追加されました。',
  'medicine.updateSuccess': '薬が正常に更新されました。',
  'medicine.deleteSuccess': '薬が正常に削除されました。',
  'medicine.errorNeedTime': '少なくとも1つの時間を選択してください。',
  'medicine.saveMedicineSuccess': '薬が正常に保存されました。',
  'medicine.saveMedicineError': 'エラー',
  'medicine.saveMedicineErrorMessage': '薬の保存に失敗しました：{e}',
  'medicine.updateMedicineSuccess': '薬が正常に更新されました。',
  'medicine.updateMedicineError': 'エラー',
  'medicine.updateMedicineErrorMessage': '薬の更新に失敗しました：{e}',
  'medicine.deleteMedicineSuccess': '薬が正常に削除されました。',
  'medicine.deleteMedicineError': 'エラー',
  'medicine.deleteMedicineErrorMessage': '薬の削除に失敗しました：{e}',
  'medicine.withFood': '食事と一緒に',
  'medicine.deleteMedicineSuccessMessage': '薬が正常に削除されました。',
  'medicine.saveMedicineSuccessMessage': '薬が正常に保存されました。',

  // Settings Page
  'settings.title': '設定',
  'settings.language': '言語',
  'settings.selectLanguage': '言語を選択',
  'settings.profile': 'プロフィール',

  // Introduction Screen
  'introduction.skip': 'スキップ',
  'introduction.done': '完了',
  'introduction.next': '次へ',

  // Filter
  'filter.allTypes': 'すべてのタイプ',
  'filter.uncategorized': 'カテゴリなし',
  'filter.searchHint': '薬を検索...',
  'filter.noResultsForSearchAndType': '\"{query}\"の{type}での検索結果はありません',
  'filter.noResultsForSearch': '\"{query}\"の検索結果はありません',
  'filter.noResultsForType': 'タイプ\"{type}\"の結果はありません',

  // Medicine Card
  'card.treatmentCompleted': '治療完了',
  'card.nextDoseN_A': '次の服用：なし',
  'card.todayAt': '今日',
  'card.tomorrowAt': '明日',
  'card.at': '時',
  'card.nextDose': '次の服用：',
  'card.frequency.onceDaily': '1日1回',
  'card.frequency.twiceDaily': '1日2回',
  'card.frequency.thriceDaily': '1日3回',
  'card.frequency.timesDaily': '1日{count}回',
  'addMedicine.nameLabelText': '名前',
  'addMedicine.dosageLabelText': '用量',
  'addMedicine.dosageQuantityHint': '量（例：500）',
  'addMedicine.categoryLabel': 'カテゴリー',
  'addMedicine.frequencyDurationLabel': '頻度と期間',
  'addMedicine.selectDoseTimesPlaceholder': '服用時間を選択',
  'addMedicine.doseTimesBottomSheetTitle': '服用時間を選択',
  'addMedicine.timesSelectedInfo': '{count}回選択済み',
  'addMedicine.selectDurationPlaceholder': '期間を選択',
  'addMedicine.durationSelectedInfo': '{count}日',
  'addMedicine.whenToTakeLabelText': '服用タイミング',
  'addMedicine.beforeFoodOption': '食前',
  'addMedicine.afterFoodOption': '食後',
  'addMedicine.notificationsSectionLabel': '通知',
  'addMedicine.notificationSubtext': '各服用の5分前に通知を受け取る',
  'addMedicine.durationPickerTitle': '期間を選択（日数）',
  'addMedicine.durationPickerItemText': '{days}日',
  'addMedicine.timesSelected': '回選択済み',
  'addMedicine.notificationsLabel': '通知',
  'addMedicine.enableDoseReminders': '服用リマインダーを有効にする',
  'addMedicine.remindersSubtext': '各服用の5分前に通知を受け取る',

  // Profile Page
  'personal_info': '個人情報',
  'preferences': '設定',
  'about_app': 'アプリについて',
  'app_version': 'アプリバージョン',
  'privacy_policy': 'プライバシーポリシー',
  'developer': '開発者：フルカン・アキフ・イスレク',
  'noEmail': 'メールが見つかりません',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': 'アカウントを削除',
  'profile.deleteAccountImportantText': '本当にアカウントを削除しますか？この操作は元に戻せません。',
  'profile.cancel': 'キャンセル',
  'profile.delete': '削除',
  'profile.errorDeletingAccount': 'アカウント削除中にエラーが発生しました',
  'profile.deleteAccountButton': 'アカウントを削除',

  // Profile Page
  'logout': 'ログアウト',
  'account': 'アカウント',

  // Blog Page
  'Blog': 'ブログ',
  'Bir hata oluştu.': 'エラーが発生しました。',
  'Blog yazısı bulunamadı.': 'ブログ記事が見つかりませんでした。',
  'Şuan blog yok': '利用可能なブログはありません',
  'pills': '錠剤',
  'health': '健康',
  'lifeStyle': 'ライフスタイル',

  // Privacy Policy
  'privacy_policy_content':
      '<h3>薬のリマインダー - プライバシーポリシー</h3><br><p><b>個人情報の使用：</b><br>私たちのアプリケーションは、ユーザーのプライバシーを保護することを約束します。薬のリマインダーアプリでは、薬の追跡とリマインダーに必要な情報（メール、プロフィール情報、服薬計画）を収集しています。この情報は、サービスの提供と改善のために使用され、第三者と共有されることはありません。</p><br><p><b>データの保存とセキュリティ：</b><br>ユーザーデータは暗号化された形式で安全なサーバーに保存されます。お薬の情報や個人データは強力なセキュリティ対策の下で保護されています。必要なスタッフのみがあなたのデータにアクセスできます。</p><br><p><b>ユーザーの権利：</b><br>ユーザーはいつでもアカウントとデータを表示、編集、削除する権利を持っています。アカウントを削除すると、すべてのデータは私たちのシステムから完全に削除されます。</p><br><p><b>Cookie とトラッキング：</b><br>アプリケーションはユーザーエクスペリエンスを向上させるために Cookie を使用することがあります。これらの Cookie はユーザーの設定とアプリケーションの使用データを保存します。必要に応じて、ブラウザの設定から Cookie を無効にすることができます。</p><br><p><b>通知：</b><br>アプリケーションは、ユーザーが承認した薬のリマインダーの通知のみを送信します。不要な通知は受け取らず、設定セクションから通知を無効にすることができます。</p><br><p><b>変更：</b><br>プライバシーポリシーは時々更新されることがあります。重要な変更がある場合、ユーザーに通知されます。アプリケーションを使用することで、これらの条件に同意したことになります。</p><br><p><b>お問い合わせ：</b><br>プライバシーポリシーに関するご質問は、お気軽にお問い合わせください。</p>',

  // Introduction Page
  "introduction.page1.title": "時間通りに薬を服用し、健康を守りましょう",
  "introduction.page1.description":
      "忙しい毎日の中で、服薬時間を忘れがちです。当アプリを使えば、もう二度と服用を忘れることはありません。お薬、時間、期間を設定すれば、私たちが適切なタイミングでお知らせします。",
  "introduction.page1.tip": "健康は、時間通りに服用するケアの一服から始まります。",

  "introduction.page2.title": "健康を追跡し、情報を得よう",
  "introduction.page2.description":
      "私たちはリマインドするだけでなく、あなたの健康に関する有益な情報も提供します。専門家の支援を受けたブログ記事で、毎日の健康習慣を強化しましょう。",
  "introduction.page2.tip": "小さな情報が大きな違いを生むことがあります。",

  "introduction.page3.title": "世界に開かれ、あなたのために個別化",
  "introduction.page3.description":
      "当アプリは16言語をサポートし、誰もがアクセスできます。使いやすいインターフェースで、数回のタップだけでお薬を追加し、生活をより便利にしましょう。",
  "introduction.page3.tip": "健康は普遍的であり、私たちもそうです。",

  "introduction.back": "戻る",
  "introduction.start": "開始",

  // Register Page
  "register.register_to_medreminder_app": "Amina Doseアプリに登録",
  "register.already_have_an_account": "すでにアカウントをお持ちですか？ ",
  "register.sign_in": "サインイン",
  "register.full_name": "氏名",
  "register.surname": "姓",
  "register.your_email": "メールアドレス",
  "register.type_your_password": "パスワードを入力",
  "register.re_type_your_password": "パスワードを再入力",
  "register.register": "登録",
  "register.fill_all_fields": "すべての項目に入力してください",
  "register.password_not_match": "パスワードが一致しません",
  "register.error_occurred": "エラーが発生しました",

  // Login Page
  "login.invalid_email": "無効なメールアドレス",
  "login.user_disabled": "ユーザーが無効になっています",
  "login.email_already_in_use": "このメールアドレスはすでに使用されています",
  "login.wrong_password": "入力された情報が正しくありません",
  "login.email_not_verified": "まずメールアドレスを確認してください",
  "login.operation_not_allowed": "この操作は許可されていません",
  "login.error_occurred": "エラーが発生しました",
  "login.error_occured_google": "Googleでサインイン中にエラーが発生しました",
  "login.please_enter_your_email": "メールアドレスを入力してください",
  "login.password_reset_email_sent": "パスワードリセットメールを送信しました",
  "login.login_into_your_account": "アカウントにログイン",
  "login.dont_have_an_account": "アカウントをお持ちでないですか？ ",
  "login.sign_up": "サインアップ",
  "login.your_email": "メールアドレス",
  "login.type_your_password": "パスワードを入力",
  "login.login": "ログイン",
  "login.forgot_password": "パスワードをお忘れですか？",
  "login.or": "または",
  "login.login_with_google": "Googleでログイン",

  // Menu Page
  "menu.myMedicines": "私の薬",
  "menu.addMedicine": "新しい薬を追加",
  "menu.blogs": "ブログ",
  "menu.profile": "プロフィール",

  'time_for_medicine': 'お薬の時間です！',
  'take_medicine_now': '今すぐ{medicineName}の{dosageInfo}を服用してください。',
};
