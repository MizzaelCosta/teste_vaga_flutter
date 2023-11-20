import 'package:flutter/material.dart';

import 'color.dart';

final appTheme = ThemeData(
  textSelectionTheme: const TextSelectionThemeData(
    selectionHandleColor: grey,
    selectionColor: greyLigth,
    cursorColor: black,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    prefixIconColor: black,
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: white)),
    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: black)),
  ),
);
