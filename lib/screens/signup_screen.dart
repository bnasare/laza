import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
