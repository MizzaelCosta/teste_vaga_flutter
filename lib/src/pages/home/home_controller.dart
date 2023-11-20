import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../repositories/local/local_repository.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase(this._storage);

  final LocalRepository _storage;
  int? index;

  @observable
  ObservableList<String> listNotes = <String>[].asObservable();

  @observable
  TextEditingController? textField = TextEditingController();

  @action
  void setTextField(String value) => textField?.text = value;

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
  void removeNote(int index) {
    listNotes.removeAt(index);
    _storage.delete(listNotes);
  }

  @action
  void _editNote(int index, String value) {
    listNotes = listNotes
      ..removeAt(index)
      ..insert(index, value);
    _storage.edit(listNotes);
    setTextField('');
    _setIndex(null);
  }

  onSubmitted(String value) {
    if (index != null) {
      _editNote(index!, value);
      return;
    }
    _addNote(value);
  }

  void _setIndex(int? value) {
    index = value;
  }

  void editNote(int index) {
    setTextField(listNotes[index]);
    _setIndex(index);
  }
}
