abstract class LocalStorage {
  Future<void> saveData<T>({
    required String key,
    required T value,
  });

  T? fetchData<T>({required String key});

  Future<void> deleteKey({required String key});

  Future<void> clean();

  Future<void> start();
}
