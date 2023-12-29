import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'controllers/controllers.dart';
import 'firebase_options.dart';
import 'helpers/helpers.dart';
import 'routes/routes.dart';
import 'translation/translation.dart';
import 'ui/components/components.dart';
import 'ui/theme/theme.dart';

Future<void> main() async {
  await _initializeFirebaseServices();
  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting().then(
    (_) => runApp(
      const MyApp(),
    ),
  );
}

Future<void> _initializeFirebaseServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final stateController = Get.put(StateController());

  bool loading = false;

  @override
  void initState() {
    super.initState();
    _startInitialServices();
  }

  void _startInitialServices() {
    _initStateLoading();
    _initStateNotification();
  }

  void _initStateLoading() {
    stateController.loading.listen((listLoadings) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          loading = listLoadings.isNotEmpty;
        });
      });
    });
  }

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
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      ),
      unknownRoute: AppPages.routes.first,
      locale: Get.deviceLocale,
      translations: AppTranslations(),
      fallbackLocale: Locale(AppLanguage.pt.locate, 'BR'),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: AppRoutes.splash,
      builder: (context, child) {
        return AppLoading(
          enable: loading,
          child: child ?? const SizedBox.shrink(),
        );
      },
    );
  }
}
