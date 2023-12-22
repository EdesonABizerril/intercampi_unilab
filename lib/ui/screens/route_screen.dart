import 'package:flutter/material.dart';

import '../../controllers/controllers.dart';
import '../templates/templates.dart';

class RouteScreen extends StatelessWidget {
  final RouteController controller;

  const RouteScreen({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return RouteTemplate(
      controller: controller,
    );
  }
}
