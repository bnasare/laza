import 'package:flutter/material.dart';

class PaymentDetailsScreen extends StatelessWidget {
  static const routeName = '/payment_details';

  const PaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
