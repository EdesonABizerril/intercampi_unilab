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
}
