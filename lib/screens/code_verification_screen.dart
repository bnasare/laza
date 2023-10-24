import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../widgets/custom_back_button.dart';
import '../widgets/navbar_button.dart';
import '../widgets/verification_code_container.dart';

class CodeVerificationScreen extends StatelessWidget {
  static const routeName = '/code_verification';

  const CodeVerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
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
                const Text(
                  "Verification Code",
                  style: TextStyle(
                    color: Color(0xFF1D1E20),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    // height: 0.04,
                    letterSpacing: -0.21,
                  ),
                ),
                SvgPicture.asset("assets/images/cloud.svg"),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.2),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      style: const TextStyle(
                        color: Color(0xFF1D1E20),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        // height: 0.11,
                      ),
                      children: const [
                        TextSpan(
                          text: " Resend confirmation code",
                          style: TextStyle(
                            color: Color(0xFF8F959E),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            // height: 0.11,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ),
        bottomNavigationBar: const NavBarButton(
          text: "Confirm Code",
        ),
      ),
    );
  }
}
