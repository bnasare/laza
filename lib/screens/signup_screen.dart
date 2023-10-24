import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/navbar_button.dart';
import '../widgets/switch.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                        // trailingWidget: const Text(
                        //   "Strong",
                        //   style: TextStyle(
                        //     color: Color(0xFF34C559),
                        //     fontSize: 11,
                        //     fontWeight: FontWeight.w400,
                        //   ),
                        // ),
                        trailingText: "Strong",
                      ),
                      AuthTextField(
                        controller: TextEditingController(),
                        labelText: "Email Address",
                        trailingWidget: const Icon(
                          Icons.check_outlined,
                          color: Colors.green,
                        ),
                      ),
                    ]),
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Remember me",
                      style: GoogleFonts.manrope(
                        color: const Color(0xFF1D1E20),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const CustomSwitch(),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const NavBarButton(text: "Sign Up"));
  }
}
