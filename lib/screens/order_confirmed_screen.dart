import 'package:flutter/material.dart';

import '../widgets/custom_back_button.dart';

class OrderConfirmedScreen extends StatelessWidget {
  static const routeName = '/order_confirmed';

  const OrderConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
      ),
    );
  }
}
