import 'package:flutter/material.dart';

class SocialAuthScreen extends StatelessWidget {
  static const routeName = '/social_auth';

  const SocialAuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
