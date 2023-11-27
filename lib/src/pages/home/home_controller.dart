import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../repositories/local/local_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase(this._storage);

  final LocalRepository _storage;

  @observable
  ObservableList<String> listNotes = <String>[].asObservable();

  @observable
  // ignore: prefer_final_fields
  TextEditingController _textField = TextEditingController();

  @computed
  TextEditingController get textField => _textField;

  @action
  void setTextField(String value) => _textField.text = value;

  int? _index;

  void _setIndex(int? value) => _index = value;

  @observable
  bool _reset = false;

  @computed
  bool get reset => _reset;

  @action
  void resetValidate(bool value) => _reset = value;

  @action
  Future<void> getListNotes() async {
    final list = await _storage.get();
    listNotes
      ..clear()
      ..addAll(list);
  }

  @action
  void _addNote(String value) {
    listNotes.add(value);
    _storage.add(listNotes);
    setTextField('');
  }

  @action
  void _updateNote(int index, String value) {
    listNotes = listNotes
      ..removeAt(index)
      ..insert(index, value);
    _storage.edit(listNotes);
    setTextField('');
    _setIndex(null);
  }

  @action
  void removeNote(int index) {
    listNotes.removeAt(index);
    _storage.delete(listNotes);
  }

  void onReset(String value) {
    setTextField(value);
    resetValidate(false);
  }

  void editNote(int index) {
    setTextField(listNotes[index]);
    _setIndex(index);
  }

  void saveSubmittedValue(String value) {
    if (_index != null) {
      _updateNote(_index!, value);
      return;
    }
    _addNote(value);
  }

  void dispose() {
    _textField.dispose();
  }
}
