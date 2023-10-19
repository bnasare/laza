import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = '/reset_password';

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
