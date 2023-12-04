import 'dart:convert';

import 'time_model.dart';

class RouteModel {
  RouteModel({
    required this.labels,
    required this.fromTimes,
    required this.returnTimes,
  });

  factory RouteModel.empty() => RouteModel(
        labels: <String>[],
        fromTimes: <List<TimeModel>>[],
        returnTimes: <List<TimeModel>>[],
      );

  List<String> labels;
  List<List<TimeModel>> fromTimes;
  List<List<TimeModel>> returnTimes;

  Map<String, dynamic> toMap() {
    return {
      'labels': labels,
      "fromTimes": fromTimes.map((e) => e.map((e) => "${e.hour}:${e.minute}").toList()).toList(),
      "toTimes": returnTimes.map((e) => e.map((e) => "${e.hour}:${e.minute}").toList()).toList(),
    };
  }

  String toJson() => json.encode(toMap());
}
