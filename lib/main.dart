import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'routes/routes.dart';
import 'translation/translation.dart';
import 'ui/theme/theme.dart';

Future<void> main() async {
  await _initializeFirebaseServices();
  await initializeDateFormatting('pt_Br').then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

Future<void> _initializeFirebaseServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
