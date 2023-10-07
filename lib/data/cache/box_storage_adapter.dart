import 'package:get_storage/get_storage.dart';

import 'cache.dart';

class BoxStorageAdapter implements LocalStorage {
  final box = GetStorage(CacheKey.boxCache);

  @override
  Future<void> saveData<T>({required String key, required T value}) async {
    await box.write(key, value);
  }

  @override
  T? fetchData<T>({required String key}) {
    return box.read<T?>(key);
  }

  @override
  Future<void> deleteKey({required String key}) async {
    await box.remove(key);
  }

  @override
  Future<void> clean() async {
    await box.erase();
  }

  @override
  Future<void> start() async {
    await GetStorage.init(CacheKey.boxCache);
  }
}
