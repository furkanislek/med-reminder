// lib/utils/localization/ko_kr.dart

const Map<String, String> koKR = {
  // General
  'general.appTitle': '약 리마인더',
  'general.save': '저장',
  'general.cancel': '취소',
  'general.delete': '삭제',
  'general.edit': '편집',
  'general.add': '추가',
  'general.confirm': '확인',
  'general.success': '성공',
  'general.error': '오류',
  'general.loading': '로딩 중...',
  'general.requiredField': '이 필드는 필수입니다',
  'general.done': '완료',

  // Auth
  'auth.login': '로그인',
  'auth.signup': '회원가입',
  'auth.logout': '로그아웃',
  'auth.email': '이메일',
  'auth.password': '비밀번호',
  'auth.loginButton': '로그인',
  'auth.signupButton': '가입하기',
  'auth.loginErrorTitle': '로그인 실패',
  'auth.signupErrorTitle': '회원가입 실패',
  'auth.unknownError': '알 수 없는 오류가 발생했습니다.',
  'auth.or': '또는',
  'auth.noAccount': '계정이 없으신가요? 가입하기',
  'auth.haveAccount': '이미 계정이 있으신가요? 로그인',

  // Home / Medicine List
  'home.title': '내 약',
  'home.addMedicine': '새 약 추가',
  'home.noMedicines': '아직 추가된 약이 없습니다. +를 탭하여 추가하세요!',
  'home.confirmDeleteTitle': '약 삭제',
  'home.confirmDeleteContent': '{medicineName}을(를) 삭제하시겠습니까?',

  // Add/Edit Medicine Page
  'addMedicine.titleAdd': '약 추가',
  'addMedicine.titleEdit': '약 편집',
  'addMedicine.nameLabel': '약 이름',
  'addMedicine.nameHint': '예: 파라세타몰',
  'addMedicine.typeLabel': '약 유형/카테고리',
  'addMedicine.typeHint': '예: 알약, 시럽, 주사',
  'addMedicine.dosageLabel': '복용량',
  'addMedicine.dosageHint': '예: 1, 2, 500',
  'addMedicine.dosageUnitLabel': '복용 단위',
  'addMedicine.dosageUnitHint': '예: 정, mL, mg',
  'addMedicine.frequencyLabel': '빈도',
  'addMedicine.frequencyHint': '예: 매일, 하루 두 번',
  'addMedicine.durationLabel': '기간 (일)',
  'addMedicine.durationHint': '예: 7, 14, 30 (계속 복용은 0)',
  'addMedicine.whenToTakeLabel': '복용 시간 / 메모',
  'addMedicine.whenToTakeHint': '예: 식사와 함께, 취침 전',
  'addMedicine.startDateLabel': '시작일',
  'addMedicine.endDateLabel': '종료일 (선택 사항)',
  'addMedicine.selectDate': '날짜 선택',
  'addMedicine.selectTime': '시간 선택',
  'addMedicine.timesLabel': '하루 복용 횟수',
  'addMedicine.addTime': '시간 추가',
  'addMedicine.notesLabel': '추가 메모 (선택 사항)',
  'addMedicine.notesHint': '예: 서늘한 곳에 보관',
  'addMedicine.enableNotificationsLabel': '복용 알림 활성화',
  'addMedicine.errorNumeric': '유효한 숫자를 입력하세요',
  'addMedicine.addMedicine': '약 추가',
  'addMedicine.save': '저장',
  'addMedicine.name': '약 이름',
  'addMedicine.addMedicineHint': '약 이름 (예: 파라세타몰)',
  'addMedicine.dosage': '복용량',
  'addMedicine.dosageHint2': '양 (예: 500)',
  'addMedicine.dosageUnit': '단위 (예: mg)',
  'addMedicine.category': '카테고리',
  'addMedicine.frequency': '빈도 & 기간',
  'addMedicine.selectDoseTimes': '복용 시간 선택',
  'addMedicine.times': '회 선택됨',
  'addMedicine.selectDuration': '기간 선택',
  'addMedicine.days': '일',
  'addMedicine.whenToTake': '복용 시간',
  'addMedicine.beforeFood': '식전',
  'addMedicine.afterFood': '식후',
  'addMedicine.notifications': '알림',
  'addMedicine.enableNotifications': '복용 알림 활성화',
  'addMedicine.receiveNotification': '각 복용 5분 전에 알림 받기',
  'addMedicine.doseTimesPickerTitle': '복용 시간 선택',
  'addMedicine.done': '완료',

  // Medicine Controller Messages
  'medicine.addSuccess': '약이 성공적으로 추가되었습니다.',
  'medicine.updateSuccess': '약이 성공적으로 업데이트되었습니다.',
  'medicine.deleteSuccess': '약이 성공적으로 삭제되었습니다.',
  'medicine.errorNeedTime': '최소 하나의 시간을 선택하세요.',
  'medicine.saveMedicineSuccess': '약이 성공적으로 저장되었습니다.',
  'medicine.saveMedicineError': '오류',
  'medicine.saveMedicineErrorMessage': '약 저장 실패: {e}',
  'medicine.updateMedicineSuccess': '약이 성공적으로 업데이트되었습니다.',
  'medicine.updateMedicineError': '오류',
  'medicine.updateMedicineErrorMessage': '약 업데이트 실패: {e}',
  'medicine.deleteMedicineSuccess': '약이 성공적으로 삭제되었습니다.',
  'medicine.deleteMedicineError': '오류',
  'medicine.deleteMedicineErrorMessage': '약 삭제 실패: {e}',
  'medicine.withFood': '식사와 함께',
  'medicine.deleteMedicineSuccessMessage': '약이 성공적으로 삭제되었습니다.',

  // Settings Page
  'settings.title': '설정',
  'settings.language': '언어',
  'settings.selectLanguage': '언어 선택',
  'settings.profile': '프로필',

  // Introduction Screen
  'introduction.skip': '건너뛰기',
  'introduction.done': '완료',
  'introduction.next': '다음',

  // Filter
  'filter.allTypes': '모든 유형',
  'filter.uncategorized': '분류되지 않음',
  'filter.searchHint': '약 검색...',
  'filter.noResultsForSearchAndType': '\"{query}\"에 대한 {type} 유형의 결과가 없습니다',
  'filter.noResultsForSearch': '\"{query}\"에 대한 결과가 없습니다',
  'filter.noResultsForType': '\"{type}\" 유형에 대한 결과가 없습니다',

  // Medicine Card
  'card.treatmentCompleted': '치료 완료',
  'card.nextDoseN_A': '다음 복용: 없음',
  'card.todayAt': '오늘',
  'card.tomorrowAt': '내일',
  'card.at': '시',
  'card.nextDose': '다음 복용:',
  'card.frequency.onceDaily': '하루 한 번',
  'card.frequency.twiceDaily': '하루 두 번',
  'card.frequency.thriceDaily': '하루 세 번',
  'card.frequency.timesDaily': '하루 {count}번',
  'addMedicine.nameLabelText': '이름',
  'addMedicine.dosageLabelText': '복용량',
  'addMedicine.dosageQuantityHint': '양 (예: 500)',
  'addMedicine.categoryLabel': '카테고리',
  'addMedicine.frequencyDurationLabel': '빈도 & 기간',
  'addMedicine.selectDoseTimesPlaceholder': '복용 시간 선택',
  'addMedicine.doseTimesBottomSheetTitle': '복용 시간 선택',
  'addMedicine.timesSelectedInfo': '{count}회 선택됨',
  'addMedicine.selectDurationPlaceholder': '기간 선택',
  'addMedicine.durationSelectedInfo': '{count}일',
  'addMedicine.whenToTakeLabelText': '복용 시간',
  'addMedicine.beforeFoodOption': '식전',
  'addMedicine.afterFoodOption': '식후',
  'addMedicine.notificationsSectionLabel': '알림',
  'addMedicine.notificationSubtext': '각 복용 5분 전에 알림 받기',
  'addMedicine.durationPickerTitle': '기간 선택 (일)',
  'addMedicine.durationPickerItemText': '{days}일',
  'addMedicine.timesSelected': '회 선택됨',
  'addMedicine.notificationsLabel': '알림',
  'addMedicine.enableDoseReminders': '복용 알림 활성화',
  'addMedicine.remindersSubtext': '각 복용 5분 전에 알림 받기',

  // Profile Page
  'personal_info': '개인 정보',
  'preferences': '환경설정',
  'about_app': '앱 정보',
  'app_version': '앱 버전',
  'privacy_policy': '개인정보 처리방침',
  'developer': '개발자: Furkan Akif İŞLEK',
  'noEmail': '이메일이 없습니다',
  'version.number': '1.0.0',
  'profile.deleteAccountImportant': '계정 삭제',
  'profile.deleteAccountImportantText': '정말로 계정을 삭제하시겠습니까? 이 작업은 취소할 수 없습니다.',
  'profile.cancel': '취소',
  'profile.delete': '삭제',
  'profile.errorDeletingAccount': '계정 삭제 중 오류 발생',
  'profile.deleteAccountButton': '계정 삭제',

  // Profile Page
  'logout': '로그아웃',
  'account': '계정',
};
