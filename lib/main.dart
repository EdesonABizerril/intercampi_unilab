import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';
import 'translation/translation.dart';
import 'ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Intercampi',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      unknownRoute: AppPages.routes.first,
      locale: Get.deviceLocale,
      translations: AppTranslations(),
      fallbackLocale: Locale(AppLanguage.pt.locate, 'BR'),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
