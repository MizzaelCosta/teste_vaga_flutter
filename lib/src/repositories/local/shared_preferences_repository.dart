import 'package:shared_preferences/shared_preferences.dart';

import 'local_repository.dart';

class LocalRepositoryWithSharedPreferences implements LocalRepository {
  LocalRepositoryWithSharedPreferences();

  late final SharedPreferences _storage;
  final key = 'listNotes';

  Future<void> getInstance() async {
    _storage = await SharedPreferences.getInstance();
  }

  Future<bool> _setList(List<String> value) async {
    return await _storage.setStringList(key, value);
  }

  @override
  Future<void> add(List<String> value) async {
    await _setList(value);
  }

  @override
  Future<List<String>> get() async {
    await getInstance();

    final list = _storage.getStringList(key);
    if (list != null) {
      return list;
    }
    return <String>[];
  }

  @override
  Future<void> delete(List<String> value) async {
    await _setList(value);
  }

  @override
  Future<void> edit(List<String> value) async {
    await _setList(value);
  }
}
