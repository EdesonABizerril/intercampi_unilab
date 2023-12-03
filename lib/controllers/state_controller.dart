import 'package:get/get.dart';

import '../../helpers/helpers.dart';

/// Controller for state
class StateController extends GetxController {

  /// Observable for toast view
  final message = (message: "", type: ToastType.empty).obs;


  /// Treat error for view
  void showError(String error) => message.value = (message: error, type: ToastType.error);

  /// Treat error for view
  void showInfo(String error) => message.value = (message: error, type: ToastType.info);

  /// Treat error for success
  void showSuccess(String success) => message.value = (message: success, type: ToastType.success);

  ///
  void cleanMessage() => message.value = (message: "", type: ToastType.empty);
}
