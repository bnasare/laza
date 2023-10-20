import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/custom_back_button.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = '/forgot_password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const Text(
              "Forgot password",
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 28,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0.04,
                letterSpacing: -0.21,
              ),
            ),
            SvgPicture.asset("assets/images/cloud.svg"),
            AuthTextField(
                controller: TextEditingController(),
                labelText: "Email Address"),
            const Text(
                "Please write your email to receive a confirmation code to set a new password")
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          height: 75,
          color: const Color(0xFF9775FA),
          child: TextButton(
              onPressed: () {},
              child: const Text(
                "Confirm Mail",
                style: TextStyle(
                  color: Color(0xFFFEFEFE),
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.06,
                ),
              ))),
    );
  }
}
