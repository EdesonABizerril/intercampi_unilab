import 'package:flutter/material.dart';

abstract class AppColors {
  const AppColors._();

  static final Color primary = _AppHexColor("#0d2541");
  static final Color primaryDark = _AppHexColor("#0c2038");
  static final Color backgroundColor = _AppHexColor("#F2F2F2");
  static const Color backgroundColorCard = Color(0xFFE3E3E3);

  static final Color borderGrey = _AppHexColor("#D4D4D4");
  static final Color shadow = _AppHexColor("#0D000000");

  static final Color fontPrimary = _AppHexColor("#000000");
  static final Color fontSecondary = _AppHexColor("#989898");
  static final Color fontLite = _AppHexColor("#E6CAD5");

  static final Color gree = _AppHexColor("#054827");
  static final Color red = _AppHexColor("#891515");
  static final Color yallow = _AppHexColor("#B18B20");
  static final Color grey = _AppHexColor("#EAEAEA");
  static final Color black = _AppHexColor("#01090FB2");
  static final Color positive = _AppHexColor("#08B868");
  static final Color positiveMedium = _AppHexColor("#84DCB4");
  static final Color alert = _AppHexColor("#F8C508");
  static final Color negative = _AppHexColor("#F64229");
  static final Color negativeMedium = _AppHexColor("#FBA194");

  static from(String color) => _AppHexColor(color);
}

// HexColor Converter
class _AppHexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    if (hexColor.isEmpty) return 0;

    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  _AppHexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
