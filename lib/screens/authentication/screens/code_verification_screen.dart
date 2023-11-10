import 'package:email_otp/email_otp.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza/screens/authentication/screens/reset_password_screen.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../widgets/verification_code_container.dart';

class CodeVerificationScreen extends StatelessWidget {
  static const routeName = '/code_verification';

  CodeVerificationScreen({Key? key}) : super(key: key);
  final TextEditingController codeOne = TextEditingController();
  final TextEditingController codeTwo = TextEditingController();
  final TextEditingController codeThree = TextEditingController();
  final TextEditingController codeFour = TextEditingController();
  bool verified = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final routeArgs = ModalRoute.of(context)?.settings.arguments as Map;
    final String email = routeArgs["email"];
    final EmailOTP? auth = routeArgs["auth"];

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
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Text(
            "Verification Code",
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CodeContainer(controller: codeOne),
                CodeContainer(controller: codeTwo),
                CodeContainer(controller: codeThree),
                CodeContainer(controller: codeFour)
              ],
            ),
          ),
          Countdown(
            seconds: 60,
            build: (BuildContext context, double time) => RichText(
              text: TextSpan(
                text: time.toString(),
                style: TextStyle(
                  color: color.secondary,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(
                      text: " resend confirmation code",
                      style: TextStyle(
                        color: color.tertiary,
                        fontWeight: FontWeight.w400,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          if (await sendOTP(auth)) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("OTP has been sent"),
                            ));
                          }
                        })
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: NavigationCard(
          text: 'Confirm Code',
          onTap: () {
            String code =
                codeOne.text + codeTwo.text + codeThree.text + codeFour.text;
            //todo: add spinner to verification call back
            verifyOTP(code, auth);
            if (verified) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Verification successful"),
                ),
              );
            }
            Navigator.pushNamed(context, ResetPasswordScreen.routeName,
                arguments: {"email": email});
          }),
    );
  }

  Future verifyOTP(verificationCode, auth) async {
    bool res = await auth?.verifyOTP(otp: verificationCode);
    verified = res;
  }

  Future<bool> sendOTP(auth) async {
    bool res = await auth?.sendOTP();
    return res;
  }
}
