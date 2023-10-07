import 'package:get/get.dart';

import '../bindings/bindings.dart';
import '../ui/screens/screens.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: SplashScreen.new,
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: HomeScreen.new,
    ),
  ];
}
