import 'dart:convert';

class TimeModel {
  final String hour;
  final String minute;

  TimeModel({required this.hour, required this.minute});

  @override
  String toString() => "$hour:$minute";

  String toJson() => json.encode(toString());

  bool isAfter(DateTime now) {
    final hour = int.parse(this.hour);
    final minute = int.parse(this.minute);
    final timeNow = DateTime(now.year, now.month, now.day, hour, minute);
    return timeNow.isAfter(now) || timeNow.difference(now).inMinutes == 0;
  }

  Duration difference(TimeModel time) {
    final hour = int.parse(this.hour);
    final minute = int.parse(this.minute);
    final timeHour = int.parse(time.hour);
    final timeMinute = int.parse(time.minute);
    final hResult = hour - timeHour;
    final mResult = minute - timeMinute;
    return Duration(
      hours: hResult * (hResult < 0 ? -1 : 1),
      minutes: mResult * (mResult < 0 ? -1 : 1),
    );
  }

  Duration differenceFromDateTime(DateTime time) => DateTime(
        time.year,
        time.month,
        time.day,
        int.parse(hour),
        int.parse(minute) + 1,
      ).difference(time);

  static TimeModel now() {
    final now = DateTime.now();
    final hour = now.hour.toString().padLeft(2, '0');
    final minute = now.minute.toString().padLeft(2, '0');

    return TimeModel(hour: hour, minute: minute);
  }

  bool isEqual(DateTime now) => now.hour == int.parse(hour) && now.minute == int.parse(minute);
}
