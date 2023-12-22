import 'package:get/get.dart';

import '../data/data.dart';
import '../controllers/controllers.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: RemoteHomeRepository(provider: RemoteHomeProvider()),
        state: Get.find<StateController>(),
      ),
    );
  }
}
