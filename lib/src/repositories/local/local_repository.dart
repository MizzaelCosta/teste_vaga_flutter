abstract class LocalRepository {
  Future<void> add(List<String> value);
  Future<List<String>> get();
  Future<void> edit(List<String> value);
  Future<void> delete(List<String> value);
}
