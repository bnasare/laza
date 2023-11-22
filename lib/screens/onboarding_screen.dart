import 'package:flutter/material.dart';
import 'package:laza/consts/sizing_config.dart';
import 'package:laza/screens/authentication/screens/social_auth_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/onboarding';

  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool("first_launch", false);
    });

    final color = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: color.primary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(children: [
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Image.asset(
                  'assets/images/onboarding_image.png',
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                );
              },
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 20.0, bottom: 5, left: 12, right: 12),
                  width: horizontalConverter(context, 345),
                  height: 244,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color.onPrimary),
                  child: Column(
                    children: [
                      Text(
                        "Look Good, Feel Good",
                        style: TextStyle(
                          color: color.secondary,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                        child: Text(
                          "Create your individual & unique style and \n              look amazing everyday.",
                          style: TextStyle(
                            color: color.tertiary,
                            fontSize: 14.5,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                SocialAuthScreen.routeName,
                              );
                            },
                            child: Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                color: color.background,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Men',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: color.tertiary),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, SocialAuthScreen.routeName);
                            },
                            child: Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                color: color.primary,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Women',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: color.onPrimary),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 9.0,
                        ),
                        child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, SocialAuthScreen.routeName);
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                color: color.tertiary,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                      ),
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
