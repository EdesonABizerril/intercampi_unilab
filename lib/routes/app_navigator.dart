// ignore_for_file: inference_failure_on_instance_creation

import 'package:get/get.dart';

import '../helpers/helpers.dart';
import 'app_routes.dart';

abstract class AppNavigator {
  /// Pushes a new named page to the stack.
  static final to = _AppNavigatorTo();

  /// Push the given named page, and then pop one page
  static final offNamed = _AppOffNamed();

  /// Push the given named page, and then pop several
  /// pages in the stack until predicate returns true
  ///
  /// Pop pages until HOME Page for default
  static Future<T?>? offUntil<T>({
    required String routeToOpen,
    String closeUntilRoute = AppRoutes.home,
  }) async =>
      Get.offNamedUntil(
        routeToOpen,
        (route) => !Get.isDialogOpen! && (route.settings.name == closeUntilRoute),
      );

  /// Push the given named page, and then pop all pages
  /// Pop pages all HOME Page for default
  static Future<T?>? offAllNamed<T>({
    required String routeToOpen,
  }) async =>
      Get.offAllNamed(
        routeToOpen,
      );

  /// Back to previus screen in the navigator stack.
  static void back<T>({T? result, bool? closeOverlays}) => Get.back<T>(
        result: result,
        closeOverlays: closeOverlays ?? false,
      );

  /// Back several screens while predicate return true.
  static void until(String routeName) {
    if (routeName.isNotEmpty) {
      Get.until(
        (route) => !Get.isDialogOpen! && (route.settings.name == routeName),
      );
    }
  }
}

/// Pop current one page and Push the given named page
class _AppOffNamed<T> {
  Future<T?>? home() {
    return Get.offNamed(
      AppRoutes.home,
    );
  }
}

class _AppNavigatorTo<T> {
  Future<T?>? route({required BusLines type}) {
    return Get.toNamed(
      AppRoutes.route,
      arguments: {
        'type': type,
      },
    );
  }
}
