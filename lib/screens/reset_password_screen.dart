import 'package:flutter/material.dart';
import 'package:laza/consts/theme.dart';
import 'package:laza/widgets/auth_text_field.dart';
import 'package:laza/widgets/bottom_auth_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  static const routeName = '/reset_password';

  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController confirmController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
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
          BottomAuthButton(
            text: 'Reset Password',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
