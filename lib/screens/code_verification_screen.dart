import 'package:flutter/material.dart';

class CodeVerificationScreen extends StatelessWidget {
  static const routeName = '/code_verification';

  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
