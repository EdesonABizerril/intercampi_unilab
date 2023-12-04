import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/models/models.dart';

extension FormateDate on DateTime {
  /// yyyy-MM-dd
  String get yyyyMMdd => DateFormat('yyyy-MM-dd').format(this);

  /// dd/MM/yyyy
  String get ddMMyyyy => DateFormat('dd/MM/yyyy').format(this);

  /// dd/MM/yyyy
  String get ddMMyy => DateFormat('dd.MM.yy').format(this);

  String get ddMMyyHHmm => DateFormat('dd.MM.yy HH:mm').format(this);

  /// dd MMM. yyyy
  String get ddMMMyyyy => _getDateWithAbbreviateMonth(this);

  /// dd de MMM
  String get ddMMM => _toPortugueseDateString(this);

  /// age
  String get age => _getAge(this);
}

String _getDateWithAbbreviateMonth(DateTime date) {
  final List<String> months = ['jan', 'fev', 'mar', 'abr', 'mai', 'jun', 'jul', 'ago', 'set', 'out', 'nov', 'dez'];
  final String formatedDate = DateFormat("dd MMM yyyy", "pt_BR").format(date);
  final String abbreviationMonth = months[date.month - 1];

  return formatedDate.replaceFirst("MMM", abbreviationMonth);
}

String _toPortugueseDateString(DateTime date) {
  final day = date.day;
  final month = date.month;

  final monthNames = [
    'janeiro',
    'fevereiro',
    'março',
    'abril',
    'maio',
    'junho',
    'julho',
    'agosto',
    'setembro',
    'outubro',
    'novembro',
    'dezembro',
  ];

  final monthName = monthNames[month - 1];

  return '$day de $monthName';
}

String _getAge(DateTime date) {
  final dateNow = DateTime.now();
  int age = dateNow.year - date.year;

  if (dateNow.month < date.month || (dateNow.month == date.month && dateNow.day < date.day)) {
    age--;
  }
  return age.toString();
}

extension DateTimeAgoExtension on DateTime {
  String toAgoString() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inHours < 1) {
      return difference.inMinutes < 2 ? 'agora' : '${difference.inMinutes}m atrás';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h atrás';
    } else if (difference.inDays < 30) {
      return '${difference.inDays}d atrás';
    } else if (difference.inDays < 365) {
      final formatter = DateFormat('dd MMM', 'pt_BR');
      return formatter.format(this);
    } else {
      final formatter = DateFormat('dd MMM, yyyy', 'pt_BR');
      return formatter.format(this);
    }
  }

  String toTimeString() {
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');

    return '$hour:$minute';
  }
}

