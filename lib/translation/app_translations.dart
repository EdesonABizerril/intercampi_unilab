import 'package:get/get.dart';

import 'languages/app_pt_translate.dart';

/// Return all translations
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        AppLanguage.pt.locate: ptTranslate,
        // AppLanguage.en.locate: enTranslate,
      };
}

enum AppLanguage {
  pt,
  // en,
}

extension AppLanguagesExtension on AppLanguage {
  String get locate {
    return switch (this) {
      AppLanguage.pt => "pt",
      // AppLanguage.en => "en",
    };
  }

  String get name {
    return switch (this) {
      AppLanguage.pt => "pt_name".tr,
      // AppLanguage.en => "en_name".tr,
    };
  }

  // SvgPicture get icon {
  //   return switch (this) {
  //      AppLanguage.pt => AppSvgImage.brazilIcon(),
  //      AppLanguage.en => AppSvgImage.euaIcon(),
  //   };
  // }
}
