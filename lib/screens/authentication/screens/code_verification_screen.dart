import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:laza/screens/authentication/screens/reset_password_screen.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../../../widgets/bottom_card.dart';
import '../../../widgets/custom_back_button.dart';
import '../widgets/verification_code_container.dart';

class CodeVerificationScreen extends StatelessWidget {
  static const routeName = '/code_verification';

  const CodeVerificationScreen({Key? key}) : super(key: key);

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
          const Padding(
            padding: EdgeInsets.only(
              bottom: 150,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CodeContainer(),
                CodeContainer(),
                CodeContainer(),
                CodeContainer()
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
                  )
                ],
              ),
            ),
          ),
        ]),
      ),
      bottomNavigationBar: NavigationCard(
          text: 'Confirm Code',
          onTap: () {
            Navigator.pushNamed(context, ResetPasswordScreen.routeName);
          }),
    );
  }
}
