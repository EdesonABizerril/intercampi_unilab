import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yaml/yaml.dart';

class SplashController extends GetxController {
  SplashController();

  Future<String> get version => _getVersion();

  Future<String> _getVersion() async {
    final pubspec = await rootBundle.loadString("pubspec.yaml");
    final yaml = loadYaml(pubspec);
    return yaml["version"].toString();
  }
}
