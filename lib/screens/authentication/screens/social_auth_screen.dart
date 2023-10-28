import 'package:flutter/material.dart';

import '../../../widgets/bottom_card.dart';
import '../../../widgets/custom_back_button.dart';
import '../../../widgets/social_auth_card.dart';

class SocialAuthScreen extends StatelessWidget {
  static const routeName = '/social_auth';

  const SocialAuthScreen({Key? key}) : super(key: key);

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
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Let's Get Started",
              style: TextStyle(
                color: color.secondary,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                height: 0,
                letterSpacing: -0.21,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SocialAuthCard(
                    text: "Facebook",
                    cardColor: const Color(0xFF4267B2),
                    image: "assets/images/Facebook.svg",
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SocialAuthCard(
                    text: "Twitter",
                    cardColor: const Color(0xFF1DA1F2),
                    image: "assets/images/Twitter.svg",
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: SocialAuthCard(
                    text: "Google",
                    cardColor: const Color(0xFFEA4335),
                    image: "assets/images/Google.svg",
                    onTap: () {},
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: RichText(
                text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      color: color.tertiary,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                    children: [
                      TextSpan(
                        text: "Sign in",
                        style: TextStyle(
                          color: color.secondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ]),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigationCard(
        text: "Create an Account",
        onTap: () {},
      ),
    );
  }
}
