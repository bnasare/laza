import 'package:flutter/material.dart';
import 'package:laza/widgets/auth_text_field.dart';
import 'package:laza/widgets/custom_back_button.dart';
import 'package:laza/widgets/navigation_card.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = '/reset_password';

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmController = TextEditingController();
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 15),
            child: Center(
              child: Text(
                'New Password',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 182, left: 20, right: 20),
            child: Center(
              child: AuthTextField(
                controller: passwordController,
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Center(
              child: AuthTextField(
                controller: confirmController,
                labelText: 'Confirm Password',
              ),
            ),
          ),
          Expanded(child: Container()),
          const Padding(
            padding: EdgeInsets.only(bottom: 25),
            child: Text(
              'Please write your new password',
              style: TextStyle(color: Color.fromRGBO(143, 149, 158, 1)),
            ),
          ),
          NavigationCard(
            text: 'Reset Password',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
