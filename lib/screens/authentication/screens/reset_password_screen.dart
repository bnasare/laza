import 'package:flutter/material.dart';
import 'package:laza/screens/authentication/screens/login_screen.dart';
import 'package:laza/screens/authentication/widgets/auth_text_field.dart';
import 'package:laza/widgets/custom_back_button.dart';

import '../../../widgets/bottom_card.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = '/reset_password';

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmController = TextEditingController();
    final color = Theme.of(context).colorScheme;

    double verticalConverter(double value) {
      double height = MediaQuery.of(context).size.height;
      double heightRatio = height / 812;
      double newValue = heightRatio * value;
      return newValue;
    }

    double horizontalConverter(double value) {
      double width = MediaQuery.of(context).size.width;
      double widthRatio = width / 375;
      double newValue = widthRatio * value;
      return newValue;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: horizontalConverter(13)),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: verticalConverter(15)),
            child: const Center(
              child: Text(
                'New Password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 28,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: verticalConverter(182),
              left: horizontalConverter(20),
              right: horizontalConverter(20),
            ),
            child: Center(
              child: AuthTextField(
                controller: passwordController,
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: verticalConverter(20),
              left: horizontalConverter(20),
              right: horizontalConverter(20),
            ),
            child: Center(
              child: AuthTextField(
                controller: confirmController,
                labelText: 'Confirm Password',
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: verticalConverter(22)),
            child: Text(
              'Please write your new password',
              style: TextStyle(color: color.tertiary),
            ),
          ),
          NavigationCard(
            text: 'Reset Password',
            onTap: () {
              Navigator.pushReplacementNamed(context, LoginScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
