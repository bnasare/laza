import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.trailingWidget,
    this.trailingText,
    required this.controller,
    required this.textInputAction,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;
  final Widget? trailingWidget;
  final String? trailingText;
  final TextInputAction textInputAction;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return TextField(
      textInputAction: textInputAction,
      style: const TextStyle(
        color: Color(0xFF1D1E20),
        fontSize: 15,
        fontWeight: FontWeight.w500,
        // height: 0.07,
      ),
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: TextStyle(
          color: color.tertiary,
        ),
        suffixIcon: trailingWidget,
        suffixText: trailingText,
        suffixStyle: const TextStyle(
          color: Color(0xFF34C559),
          fontSize: 11,
          fontWeight: FontWeight.w400,
        ),
        suffixIconColor: const Color(0xFF34C559),
      ),
    );
  }
}
