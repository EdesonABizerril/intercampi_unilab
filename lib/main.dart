import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Intercampi',
      locale: Get.deviceLocale,
      translations: AppTranslations(),
      fallbackLocale: Locale(AppLanguage.pt.locate, 'BR'),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.splash,
    );
  }
}
