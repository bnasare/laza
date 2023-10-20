import 'package:flutter/material.dart';

import '../widgets/custom_back_button.dart';

class CodeVerificationScreen extends StatelessWidget {
  static const routeName = '/code_verification';

  const CodeVerificationScreen({Key? key}) : super(key: key);

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
