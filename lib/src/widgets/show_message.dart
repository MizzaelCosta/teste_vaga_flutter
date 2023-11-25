import 'package:flutter/material.dart';
import 'package:teste_vaga_flutter/src/constants/color.dart';

class Message {
  Message._internal({
    required BuildContext context,
    required String message,
    Color? color,
  }) {
    if (ScaffoldMessenger.of(context).mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        content: Text(message),
        showCloseIcon: true,
        closeIconColor: white,
        elevation: 10.0,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  factory Message.showSnackBarError({
    required BuildContext context,
    required String message,
  }) {
    return Message._internal(
      context: context,
      message: message,
      color: red,
    );
  }

  factory Message.showSnackBarAlert({
    required BuildContext context,
    required String message,
  }) {
    return Message._internal(
      context: context,
      message: message,
      color: grey,
    );
  }
}
