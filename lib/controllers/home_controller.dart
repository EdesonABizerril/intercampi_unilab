import 'package:get/get.dart';

import 'controllers.dart';
import '../data/data.dart';

class HomeController extends GetxController {
  HomeController({required this.repository, required this.state});

  final RemoteHomeRepository repository;
  final StateController state;

  final _tipsIntercampi = "".obs;
  final _dateUpdate = DateTime.now().obs;

  String get tipesIntercampi => _tipsIntercampi.value;
  DateTime get dateUpdate => _dateUpdate.value;

  @override
  void onInit() {
    super.onInit();
    _getInitialData();
  }

  Future<void> _getInitialData() async {
    try {
      _tipsIntercampi.value = await repository.loadTips();
    } catch (e) {
      state.showError("Erro ao carregar dados. Conecte-se a internet e tente novamente.");
    }
  }
}
