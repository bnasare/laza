import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField(
      {super.key, required this.controller, required this.labelText});

  final TextEditingController controller;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: const TextStyle(
          color: Color.fromRGBO(143, 149, 158, 1),
        ),
      ),
    );
  }
}
