import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';
import '../templates/templates.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return HomeTemplate(
      controller: controller,
    );
  }
}
