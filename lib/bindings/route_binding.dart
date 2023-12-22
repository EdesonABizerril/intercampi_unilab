import 'package:get/get.dart';

import '../controllers/controllers.dart';
import '../data/data.dart';

class RouteBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<RouteController>(
      RouteController(
        state: Get.find<StateController>(),
        repository: RemoteRouteRepository(
          remoteProvider: RemoteRouteProvider(),
        ),
      ),
    );
  }
}
