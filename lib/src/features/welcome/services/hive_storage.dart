abstract class HiveStorage<T> {
  Future<void> addToBox(String tag, T value);
}
