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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Forgot password",
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                // height: 0.04,
                letterSpacing: -0.21,
              ),
            ),
            SvgPicture.asset("assets/images/cloud.svg"),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height * 0.2),
              child: AuthTextField(
                  controller: TextEditingController(),
                  labelText: "Email Address"),
            ),
            const Text(
              "Please write your email to receive a confirmation code to set a new password",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF8F959E),
                fontSize: 13,
                fontWeight: FontWeight.w400,
                // height: 0.11,
              ),
            )
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
                  fontWeight: FontWeight.w500,
                  height: 0.06,
                ),
              ))),
    );
  }
}
