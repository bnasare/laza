import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/bottom_card.dart';
import '../../../widgets/custom_back_button.dart';
import '../widgets/auth_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const routeName = '/forgot_password';

  const ForgotPasswordScreen({Key? key}) : super(key: key);

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
                    controller: TextEditingController(),
                    labelText: "Email Address"),
              ),
              Text(
                "Please write your email to receive a confirmation code to set a new password",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color.tertiary,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar:
            NavigationCard(text: 'Confirm Mail', onTap: () {}));
  }
}
