import 'package:get/get.dart';

import '../bindings/bindings.dart';
import '../controllers/controllers.dart';
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
      page: () => HomeScreen(
        controller: Get.find<HomeController>(),
      ),
      bindings: [HomeBinding(), RouteBinding()],
    ),
    GetPage(
      name: AppRoutes.route,
      page: () => RouteScreen(
        controller: Get.find<RouteController>(),
      ),
    ),
    GetPage(
      name: AppRoutes.about,
      page: () => const AboutScreen(),
    ),
  ];
}
