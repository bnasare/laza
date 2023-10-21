import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/switch.dart';

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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.1),
            child: RichText(
              textAlign: TextAlign.center,
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
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                const Text(
                  "Forgot password??",
                  style: TextStyle(
                    color: Color(0xFFEA4335),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ]),
          Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.05),
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
          RichText(
            textAlign: TextAlign.center,
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
                  text: " Terms and conditions",
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
