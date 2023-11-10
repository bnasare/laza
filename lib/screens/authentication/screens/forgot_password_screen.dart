import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:laza/screens/authentication/screens/code_verification_screen.dart';

import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = '/forgot_password';

  ForgotPasswordScreen({Key? key}) : super(key: key);
  final TextEditingController emailController = TextEditingController();
  final EmailOTP myAuth = EmailOTP();
  bool sent = false;

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Forgot password",
              style: TextStyle(
                color: color.secondary,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.21,
              ),
            ),
            SvgPicture.asset("assets/images/cloud.svg"),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 150,
              ),
              child: AuthTextField(
                  controller: emailController, labelText: "Email Address"),
            ),
            Text(
              "Please write your email to receive a confirmation code to set a new password",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color.tertiary,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationCard(
          text: 'Confirm Mail',
          onTap: () {
            final String userEmail = emailController.value.text;
            sendOTP();
            if (sent) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("OTP has been sent"),
              ));
            }
            Navigator.pushNamed(context, CodeVerificationScreen.routeName,
                arguments: {"email": userEmail, "auth": myAuth});
          }),
    );
  }

  Future sendOTP() async {
    myAuth.setConfig(
        appEmail: "laza@gmail.com",
        appName: "Laza",
        userEmail: emailController.value.text,
        otpLength: 4,
        otpType: OTPType.digitsOnly);

    bool res = await myAuth.sendOTP();
    sent = res;
  }
}
