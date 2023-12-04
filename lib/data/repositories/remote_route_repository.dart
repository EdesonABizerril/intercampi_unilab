import '../../helpers/helpers.dart';
import '../models/models.dart';
import '../providers/providers.dart';

class RemoteRouteRepository {
  RemoteRouteRepository({
    required this.remoteProvider,
  });

  final RemoteRouteProvider remoteProvider;

  Future<RouteModel> loadRoutes(BusLines type) => remoteProvider.loadRoutes(type);
}
