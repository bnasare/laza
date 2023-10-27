import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../widgets/bottom_navigation_card.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/switch.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Welcome\n",
                      style: TextStyle(
                        color: color.secondary,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: -0.21,
                      ),
                      children: [
                        TextSpan(
                          text: "Please enter your data to continue",
                          style: TextStyle(
                            color: color.tertiary,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  AuthTextField(
                    controller: TextEditingController(),
                    labelText: "Username",
                    trailingWidget: const Icon(
                      Icons.check_outlined,
                    ),
                  ),
                  AuthTextField(
                    controller: TextEditingController(),
                    labelText: "Password",
                    trailingText: "Strong",
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Forgot password??",
                      style: TextStyle(
                        color: color.onBackground,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Remember me",
                        style: GoogleFonts.manrope(
                          color: color.tertiary,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const CustomSwitch(initialState: false),
                    ],
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        "By connecting you account, confirm that you agree to our",
                    style: TextStyle(
                      color: color.tertiary,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    children: [
                      TextSpan(
                        text: " Terms and conditions",
                        style: TextStyle(
                          color: color.secondary,
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
        bottomNavigationBar: NavigationCard(text: 'Login', onTap: () {}));
  }
}
