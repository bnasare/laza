import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.contentPadding,
    required this.maxLines,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final EdgeInsetsGeometry contentPadding;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      textAlignVertical: TextAlignVertical.top,
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: contentPadding,
        filled: true,
        fillColor: color.background,
        hintText: hintText,
        hintStyle: TextStyle(color: color.tertiary),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
