import 'package:get/get.dart';

import 'controllers.dart';
import '../helpers/helpers.dart';
import '../data/data.dart';

class RouteController extends GetxController {
  RouteController({
    required this.state,
    required this.repository,
  });

  final StateController state;
  final RemoteRouteRepository repository;

  final _routes = <BusLines, RouteModel>{};
  BusLines typeSelected = BusLines.empty;

  RouteModel get routes => _routes[typeSelected] ?? RouteModel.empty();

  final now = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    _initUpdateDateTimeNow();
    _loadRouteDataCache();
  }

  void getInitialType() {
    typeSelected = Get.arguments?['type'] as BusLines? ?? BusLines.empty;
  }

  ({List<TimeModel> from, List<TimeModel> to}) getTimesList(int index) =>
      (from: routes.fromTimes[index], to: routes.returnTimes[index]);

  int listLenght(int index) {
    final fromLength = routes.fromTimes.length;
    final toLength = routes.returnTimes.length;
    return fromLength > toLength ? fromLength : toLength;
  }

  void _initUpdateDateTimeNow() {
    Future.delayed(const Duration(seconds: 1), () {
      now.value = DateTime.now();
      _initUpdateDateTimeNow();
    });
  }

  Future<void> _loadRouteDataCache() async {
    try {
      state.startLoading();
      final routesDatas = await Future.wait(
        BusLines.values
            .where((l) => l != BusLines.empty)
            .map(
              (e) => repository.loadRoutes(e),
            )
            .toList(),
      );

      for (var i = 0; i < BusLinesUtil.validItems().length; i++) {
        final typeRoute = BusLinesUtil.validItems()[i];
        _routes[typeRoute] = routesDatas[i];
      }
    } catch (e) {
      state.showError("error_load_route_data".tr);
    } finally {
      state.stopLoading();
    }
  }

  TimeModel findBefore(DateTime now, List<TimeModel> dateTimeList) {
    if (dateTimeList.length < 3) {
      throw ArgumentError("A lista de DateTime deve conter pelo menos 3 itens");
    }

    int nowIndex = dateTimeList.indexWhere((dt) => dt.isAfter(now));

    if (nowIndex == -1) {
      return dateTimeList.last;
    }

    int previousIndex = nowIndex - 1;
    if (previousIndex < 0) {
      previousIndex = dateTimeList.length - 1;
    }
    final previous = dateTimeList[previousIndex];

    return previous.isEqual(now) ? dateTimeList[nowIndex - 1] : previous;
  }

  TimeModel findNext(DateTime now, List<TimeModel> dateTimeList) {
    if (dateTimeList.length < 3) {
      throw ArgumentError("A lista de DateTime deve conter pelo menos 3 itens");
    }

    TimeModel nowSimple = TimeModel(hour: now.hour.toString(), minute: now.minute.toString());
    int nowIndex = dateTimeList.indexWhere((dt) => dt.isAfter(now) || dt.difference(nowSimple).inMinutes == 0);

    if (nowIndex == -1) {
      return dateTimeList.first;
    }

    int nextIndex = nowIndex;
    if (nextIndex >= dateTimeList.length) {
      nextIndex = 0;
    }

    return dateTimeList[nextIndex];
  }

  TimeModel findAfter(DateTime now, List<TimeModel> dateTimeList) {
    if (dateTimeList.length < 3) {
      throw ArgumentError("A lista de DateTime deve conter pelo menos 3 itens");
    }

    int nowIndex = dateTimeList.indexWhere((dt) => dt.isAfter(now));

    if (nowIndex == -1) {
      return dateTimeList.first;
    }

    int nextIndex = nowIndex;
    if (nextIndex >= dateTimeList.length) {
      nextIndex = 0;
    }

    int secondNextIndex = nextIndex + 1;
    if (secondNextIndex >= dateTimeList.length) {
      secondNextIndex = 0;
    }

    return dateTimeList[secondNextIndex];
  }

  ({TimeModel after, TimeModel before, TimeModel next}) getFromTimesRange({required int indexTab}) {
    TimeModel before = findBefore(now.value, routes.fromTimes[indexTab]);
    TimeModel next = findNext(now.value, routes.fromTimes[indexTab]);
    TimeModel after = findAfter(now.value, routes.fromTimes[indexTab]);
    return (before: before, next: next, after: after);
  }

  ({TimeModel after, TimeModel before, TimeModel next}) getReturnTimesRange({required int indexTab}) {
    TimeModel before = findBefore(now.value, routes.returnTimes[indexTab]);
    TimeModel next = findNext(now.value, routes.returnTimes[indexTab]);
    TimeModel after = findAfter(now.value, routes.returnTimes[indexTab]);
    return (before: before, next: next, after: after);
  }
}
