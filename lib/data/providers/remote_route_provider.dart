import 'package:cloud_firestore/cloud_firestore.dart';

import '../../helpers/helpers.dart';
import '../models/models.dart';

class RemoteRouteProvider {
  RemoteRouteProvider();

  Future<RouteModel> loadRoutes(BusLines busLine) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore.instance.collection(busLine.id).get();
      final routeNamesIndex = snapshot.docs.map((e) => e.id).toList().indexOf("Routes");
      final fromDataIndex = snapshot.docs.map((e) => e.id).toList().indexOf(busLine.fromName);
      final toDataIndex = snapshot.docs.map((e) => e.id).toList().indexOf(busLine.toName);

      if (routeNamesIndex == -1) {
        throw Exception();
      }

      final data = _ordenarMapas(snapshot.docs.map((e) => e.data()).toList());

      List<String> routeNames = data[routeNamesIndex].values.map((e) => e as String).toList();
      List<List<TimeModel>> fromTimes = _converterTime(data[fromDataIndex].values.map((e) => e as String).toList());
      List<List<TimeModel>> toTimes = _converterTime(data[toDataIndex].values.map((e) => e as String).toList());

      return RouteModel(labels: routeNames, fromTimes: fromTimes, returnTimes: toTimes);
    } catch (e) {
      rethrow;
    }
  }

  List<Map<String, dynamic>> _ordenarMapas(List<Map<String, dynamic>> lista) {
    for (var i = 0; i < lista.length; i++) {
      var chavesOrdenadas = lista[i].keys.toList()..sort();
      var novoMapa = Map.fromEntries(chavesOrdenadas.map((chave) => MapEntry(chave, lista[i][chave])));
      lista[i] = novoMapa;
    }

    lista.sort((a, b) => (a.keys.first).compareTo(b.keys.first));

    return lista;
  }

  List<List<TimeModel>> _converterTime(List<String> data) => data
      .map((e) => e.toString().trim().split(','))
      .map((d) => d.where((c) => c.contains(':') && c.length == 5).map((e) {
            final time = e.split(':').map((e) => e);
            return TimeModel(hour: time.first, minute: time.last);
          }).toList())
      .toList();
}
