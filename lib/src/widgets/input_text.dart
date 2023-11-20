import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    this.label,
    required this.controller,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.focusNode,
    this.textAlign = TextAlign.start,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.radius = 8.0,
  });
  final String? label;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextAlign textAlign;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.all(Radius.circular(radius));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Visibility(
            visible: label != null,
            child: Text(
              label ?? '',
              style: const TextStyle(color: white),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: white,
            borderRadius: borderRadius,
          ),
          child: TextFormField(
            controller: controller,
            validator: validator,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            textCapitalization: textCapitalization,
            textInputAction: textInputAction,
            autofocus: true,
            focusNode: focusNode,
            textAlign: textAlign,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle,
              prefixIcon: prefixIcon,
              border: OutlineInputBorder(
                borderRadius: borderRadius,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
