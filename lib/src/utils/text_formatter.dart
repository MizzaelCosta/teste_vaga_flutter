import 'package:flutter/services.dart';

class TextFormatter extends TextInputFormatter {
  const TextFormatter();

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

    return TextEditingValue(text: text);
  }
}
