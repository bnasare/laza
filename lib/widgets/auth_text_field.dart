import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.trailingWidget,
    required this.controller,
    required this.labelText,
  });

  final TextEditingController controller;
  final String labelText;
  final Widget? trailingWidget;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(
        color: Color(0xFF1D1E20),
        fontSize: 15,
        fontWeight: FontWeight.w500,
        height: 0.07,
      ),
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: const TextStyle(
          color: Color.fromRGBO(143, 149, 158, 1),
        ),
        suffixIcon: trailingWidget,
      ),
    );
  }
}
