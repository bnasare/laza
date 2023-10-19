import 'package:flutter/material.dart';

class ReviewScreen extends StatelessWidget {
  static const routeName = '/review';

  const ReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
