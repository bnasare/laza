import 'package:flutter/material.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/switch.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              const Text(
                "Sign Up",
                style: TextStyle(
                  color: Color(0xFF1D1E20),
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.21,
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
                trailingWidget: Text("Strong"),
              ),
              AuthTextField(
                controller: TextEditingController(),
                labelText: "Email Address",
                trailingWidget: const Icon(
                  Icons.check_outlined,
                  color: Colors.green,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Remember me"), MySwitch(state: state)],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          height: 75,
          color: const Color(0xFF9775FA),
          child: TextButton(
              onPressed: () {},
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  color: Color(0xFFFEFEFE),
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  height: 0.06,
                ),
              )),
        ));
  }
}
