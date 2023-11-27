// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  Computed<TextEditingController>? _$textFieldComputed;

  @override
  TextEditingController get textField => (_$textFieldComputed ??=
          Computed<TextEditingController>(() => super.textField,
              name: 'HomeControllerBase.textField'))
      .value;
  Computed<bool>? _$resetComputed;

  @override
  bool get reset => (_$resetComputed ??=
          Computed<bool>(() => super.reset, name: 'HomeControllerBase.reset'))
      .value;

  late final _$noteListAtom =
      Atom(name: 'HomeControllerBase.noteList', context: context);

  @override
  ObservableList<String> get noteList {
    _$noteListAtom.reportRead();
    return super.noteList;
  }

  @override
  set noteList(ObservableList<String> value) {
    _$noteListAtom.reportWrite(value, super.noteList, () {
      super.noteList = value;
    });
  }

  late final _$_textFieldAtom =
      Atom(name: 'HomeControllerBase._textField', context: context);

  @override
  TextEditingController get _textField {
    _$_textFieldAtom.reportRead();
    return super._textField;
  }

  @override
  set _textField(TextEditingController value) {
    _$_textFieldAtom.reportWrite(value, super._textField, () {
      super._textField = value;
    });
  }

  late final _$_resetAtom =
      Atom(name: 'HomeControllerBase._reset', context: context);

  @override
  bool get _reset {
    _$_resetAtom.reportRead();
    return super._reset;
  }

  @override
  set _reset(bool value) {
    _$_resetAtom.reportWrite(value, super._reset, () {
      super._reset = value;
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
  void resetValidate(bool value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.resetValidate');
    try {
      return super.resetValidate(value);
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
  void _updateNote(int index, String value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase._updateNote');
    try {
      return super._updateNote(index, value);
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
  String toString() {
    return '''
noteList: ${noteList},
textField: ${textField},
reset: ${reset}
    ''';
  }
}
