import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static final Color primary = HexColor("#0d2541");
  static final Color primaryDark = HexColor("#0c2038");
  static final Color backgroundColor = HexColor("#F2F2F2");

  static final Color fontPrimary = HexColor("#000000");
  static final Color fontSecondary = HexColor("#989898");
  static final Color fontLite = HexColor("#E6CAD5");

  static final Color white = HexColor("#ECECEC");
  static final Color black = HexColor("#01090FB2");
}

// HexColor Converter
class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
