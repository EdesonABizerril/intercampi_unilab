import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intercampi/routes/routes.dart';
import 'package:yaml/yaml.dart';

class SplashController extends GetxController {
  SplashController();

  @override
  void onInit() {
    super.onInit();
    _initAction();
  }

  Future<String> get version => _getVersion();

  Future<String> _getVersion() async {
    final pubspec = await rootBundle.loadString("pubspec.yaml");
    final yaml = loadYaml(pubspec);
    return yaml["version"].toString();
  }

  void _initAction() {
    Future.delayed(
      const Duration(seconds: 3),
      () => AppNavigator.offNamed.home(),
    );
  }
}
