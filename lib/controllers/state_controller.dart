import 'package:get/get.dart';

import '../../helpers/helpers.dart';

/// Controller for state
class StateController extends GetxController {
  /// Observable
  final _loadings = RxList<bool>();

  Stream<List<bool>> get loading => _loadings.stream;

  /// Observable for toast view
  final message = (message: "", type: ToastType.empty).obs;

  /// Get state for loading
  bool get isLoading => _loadings.isNotEmpty;

  /// Define value true for loading
  void startLoading() {
    _loadings.add(true);
    _loadings.refresh();
  }

  /// Define value false for loading
  void stopLoading() {
    if (_loadings.isNotEmpty) {
      _loadings.removeLast();
      _loadings.refresh();
    }
  }

  /// Treat error for view
  void showError(String error) => message.value = (message: error, type: ToastType.error);

  /// Treat error for view
  void showInfo(String error) => message.value = (message: error, type: ToastType.info);

  /// Treat error for success
  void showSuccess(String success) => message.value = (message: success, type: ToastType.success);

  ///
  void cleanMessage() => message.value = (message: "", type: ToastType.empty);
}
