import 'package:get/get.dart';

import '../data/cache/cache.dart';
import '../translation/app_translations.dart';

class TranslateController extends GetxController {
  TranslateController(this.storage);

  final LocalStorage storage;

  AppLanguage locate = AppLanguage.pt;

  void loadLocate() {
    final cacheLocate = storage.fetchData<String>(key: CacheKey.locate);
    locate = _selectLocate(cacheLocate ?? AppLanguage.pt.locate);
    refresh();
  }

  void setLocate({required String locate}) {
    storage.saveData<String>(key: CacheKey.locate, value: locate);
    this.locate = _selectLocate(locate);
    refresh();
  }

  AppLanguage _selectLocate(String code) => AppLanguage.values.firstWhere(
        (t) => t.locate == code,
        orElse: () => AppLanguage.pt,
      );
}
