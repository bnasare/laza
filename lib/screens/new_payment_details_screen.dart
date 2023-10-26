
import 'package:flutter/material.dart';

import '../widgets/custom_back_button.dart';

class NewPaymentDetailsScreen extends StatelessWidget {
  static const routeName = '/new_payment_details';

  const NewPaymentDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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