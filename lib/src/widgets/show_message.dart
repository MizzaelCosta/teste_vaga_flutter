import 'package:flutter/material.dart';
import 'package:teste_vaga_flutter/src/constants/color.dart';

class ShowMessage {
  ShowMessage({
    required context,
    required message,
  }) {
    showSnackBar(context, message);
  }

  showSnackBar(context, message) {
    if (ScaffoldMessenger.of(context).mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        showCloseIcon: true,
        closeIconColor: white,
        elevation: 10.0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
