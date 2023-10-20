import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key, required this.controller, required this.labelText});

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: TextStyle(
          color: color.tertiary,
        ),
      ),
    );
  }
}
