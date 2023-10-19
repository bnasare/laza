import 'package:flutter/material.dart';

class AddReviewScreen extends StatelessWidget {
  static const routeName = '/add_review';

  const AddReviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
