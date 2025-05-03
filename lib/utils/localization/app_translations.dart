import 'package:get/get.dart';
import 'package:mr/utils/localization/en_us.dart';
import 'package:mr/utils/localization/tr_tr.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'tr_TR': trTR,
      };
}

