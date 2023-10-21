import 'package:flutter/material.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/switch.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    bool state = false;

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
        child: Column(children: [
          RichText(
            text: const TextSpan(
              text: "Welcome\n",
              style: TextStyle(
                color: Color(0xFF1D1E20),
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: -0.21,
              ),
              children: [
                TextSpan(
                  text: "Please enter your data to continue",
                  style: TextStyle(
                    color: Color(0xFF8F959E),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
          AuthTextField(
            controller: TextEditingController(),
            labelText: "Username",
            trailingWidget: const Icon(
              Icons.check_outlined,
              color: Colors.green,
            ),
          ),
          AuthTextField(
            controller: TextEditingController(),
            labelText: "Password",
            trailingWidget: const Text(
              "Strong",
              style: TextStyle(
                color: Color(0xFF34C559),
                fontSize: 11,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Text(
            "Forgot password??",
            style: TextStyle(
              color: Color(0xFFEA4335),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [const Text("Remember me"), MySwitch(state: state)],
          ),
          RichText(
            text: const TextSpan(
              text: "By connecting you account, confirm that you agree to our",
              style: TextStyle(
                color: Color(0xFF8F959E),
                fontSize: 13,
                fontWeight: FontWeight.w400,
                height: 0,
              ),
              children: [
                TextSpan(
                  text: "terms and conditions",
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 75,
        color: const Color(0xFF9775FA),
        child: TextButton(
          onPressed: () {},
          child: const Text(
            "Login",
            style: TextStyle(
              color: Color(0xFFFEFEFE),
              fontSize: 17,
              fontWeight: FontWeight.w500,
              height: 0.06,
            ),
          ),
        ),
      ),
    );
  }
}
