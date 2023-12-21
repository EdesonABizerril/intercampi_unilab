import '../providers/providers.dart';

class RemoteHomeRepository {
  RemoteHomeRepository({required this.provider});

  final RemoteHomeProvider provider;

  Future<String> loadTips() => provider.loadTips();
}
