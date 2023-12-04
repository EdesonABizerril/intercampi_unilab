import 'package:flutter/widgets.dart';

import '../../ui/theme/theme.dart';

enum BusLines {
  liberdadePalmares,
  liberdadeAuroras,
  aurorasPalmares,
  empty,
}

extension BusLinesUtil on BusLines {
  static List<BusLines> validItems() => [
        BusLines.liberdadePalmares,
        BusLines.liberdadeAuroras,
        BusLines.aurorasPalmares,
      ];

  String get id {
    switch (this) {
      case BusLines.liberdadePalmares:
        return "LiberdadePalmares";
      case BusLines.liberdadeAuroras:
        return "LiberdadeAuroras";
      case BusLines.aurorasPalmares:
        return "AurorasPalmares";
      default:
        return "";
    }
  }

  String get fromName {
    switch (this) {
      case BusLines.liberdadePalmares:
        return "Liberdade";
      case BusLines.liberdadeAuroras:
        return "Liberdade";
      case BusLines.aurorasPalmares:
        return "Auroras";
      default:
        return "";
    }
  }

  String get toName {
    switch (this) {
      case BusLines.liberdadePalmares:
        return "Palmares";
      case BusLines.liberdadeAuroras:
        return "Auroras";
      case BusLines.aurorasPalmares:
        return "Palmares";
      default:
        return "";
    }
  }

  Color get color {
    switch (this) {
      case BusLines.liberdadePalmares:
        return AppColors.gree.withAlpha(200);
      case BusLines.liberdadeAuroras:
        return AppColors.red.withAlpha(200);
      case BusLines.aurorasPalmares:
        return AppColors.yallow.withAlpha(200);
      default:
        return AppColors.backgroundColor;
    }
  }
}
