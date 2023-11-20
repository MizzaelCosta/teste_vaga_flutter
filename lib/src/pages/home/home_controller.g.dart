// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$listNotesAtom =
      Atom(name: 'HomeControllerBase.listNotes', context: context);

  @override
  ObservableList<String> get listNotes {
    _$listNotesAtom.reportRead();
    return super.listNotes;
  }

  @override
  set listNotes(ObservableList<String> value) {
    _$listNotesAtom.reportWrite(value, super.listNotes, () {
      super.listNotes = value;
    });
  }

  late final _$textFieldAtom =
      Atom(name: 'HomeControllerBase.textField', context: context);

  @override
  TextEditingController? get textField {
    _$textFieldAtom.reportRead();
    return super.textField;
  }

  @override
  set textField(TextEditingController? value) {
    _$textFieldAtom.reportWrite(value, super.textField, () {
      super.textField = value;
    });
  }

  late final _$getListNotesAsyncAction =
      AsyncAction('HomeControllerBase.getListNotes', context: context);

  @override
  Future<void> getListNotes() {
    return _$getListNotesAsyncAction.run(() => super.getListNotes());
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void setTextField(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setTextField');
    try {
      return super.setTextField(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _addNote(String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase._addNote');
    try {
      return super._addNote(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeNote(int index) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.removeNote');
    try {
      return super.removeNote(index);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _editNote(int index, String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase._editNote');
    try {
      return super._editNote(index, value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listNotes: ${listNotes},
textField: ${textField}
    ''';
  }
}
