import 'package:flutter/material.dart';

class OrderConfirmedScreen extends StatelessWidget {
  static const routeName = '/order_confirmed';

  const OrderConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
