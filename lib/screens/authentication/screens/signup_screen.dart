import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/bottom_card.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/switch.dart';
import '../widgets/auth_text_field.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

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
              Text(
                "Sign Up",
                style: TextStyle(
                  color: color.secondary,
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.21,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Column(children: [
                  AuthTextField(
                    controller: TextEditingController(),
                    labelText: "Username",
                    trailingWidget: Icon(
                      Icons.check_outlined,
                      color: color.onSecondary,
                    ),
                  ),
                  AuthTextField(
                    controller: TextEditingController(),
                    labelText: "Password",
                    trailingText: "Strong",
                  ),
                  AuthTextField(
                    controller: TextEditingController(),
                    labelText: "Email Address",
                    trailingWidget: Icon(
                      Icons.check_outlined,
                      color: color.onSecondary,
                    ),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Remember me",
                      style: GoogleFonts.manrope(
                        color: color.secondary,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const CustomSwitch(initialState: true),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: NavigationCard(text: 'Sign Up', onTap: () {}));
  }
}
