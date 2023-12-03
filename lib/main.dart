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
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final stateController = Get.put(StateController());


  void _startInitialServices() {
    _initStateNotification();

  void _initStateNotification() {
    stateController.message.listen((message) {
      if (message.type != ToastType.empty) {
        if (mounted) {
          _toastView(message);
        }
        stateController.cleanMessage();
      }
    });
  }

  void _toastView(({String message, ToastType type}) toast) {
    switch (toast.type) {
      case ToastType.error:
        GetxToast.toastError(message: toast.message);
      case ToastType.info:
        GetxToast.toastInfo(message: toast.message);
      case ToastType.success:
      case ToastType.empty:
        GetxToast.toastSuccess(message: toast.message);
  }
  }

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
