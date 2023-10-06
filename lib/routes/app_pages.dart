import 'package:get/get.dart';

import '../ui/screens/screens.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage<dynamic>> routes = [
    GetPage(
      name: AppRoutes.splash,
      page: SplashScreen.new,
    ),
    GetPage(
      name: AppRoutes.home,
      page: HomeScreen.new,
    ),
  ];
}
