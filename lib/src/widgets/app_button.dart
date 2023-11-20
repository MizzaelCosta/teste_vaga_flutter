import 'package:flutter/material.dart';
import 'package:teste_vaga_flutter/src/constants/color.dart';
import 'package:teste_vaga_flutter/src/constants/style.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2;
    const heigth = 50.0;

    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(width, heigth)),
        backgroundColor: const MaterialStatePropertyAll(green),
        shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(heigth / 2)))),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: textStyleWhite,
      ),
    );
  }
}
