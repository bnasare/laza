
// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laza/provider/internet_provider.dart';
import 'package:laza/provider/sign_in_provider.dart';
import 'package:laza/screens/authentication/screens/signup_screen.dart';
import 'package:laza/screens/home_screen.dart';
import 'package:laza/utils/snack_bar.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../widgets/social_auth_card.dart';

class SocialAuthScreen extends StatefulWidget {
  static const routeName = '/social_auth';

  const SocialAuthScreen({Key? key}) : super(key: key);

  @override
  State<SocialAuthScreen> createState() => _SocialAuthScreenState();
}

class _SocialAuthScreenState extends State<SocialAuthScreen> {
  final GlobalKey _scaffoldKey = GlobalKey<ScaffoldState>();
  final RoundedLoadingButtonController googleController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController facebookController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController twitterController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      key: _scaffoldKey,
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
                  child: RoundedLoadingButton(
                    color: const Color(0xFF4267B2),
                    onPressed: () {
                      handleFacebookAuth();
                    },
                    controller: facebookController,
                    child: const SocialAuthCard(
                      text: "Facebook",
                      cardColor: Color(0xFF4267B2),
                      image: "assets/images/Facebook.svg",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: RoundedLoadingButton(
                    controller: twitterController,
                    color: const Color(0xFF1DA1F2),
                    onPressed: () {},
                    child: const SocialAuthCard(
                      text: "Twitter",
                      cardColor: Color(0xFF1DA1F2),
                      image: "assets/images/Twitter.svg",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: RoundedLoadingButton(
                    controller: googleController,
                    onPressed: () {
                      handleGoogleSignIn();
                    },
                    color: const Color(0xFFEA4335),
                    child: const SocialAuthCard(
                      text: "Google",
                      cardColor: Color(0xFFEA4335),
                      image: "assets/images/Google.svg",
                    ),
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
        onTap: () {
          Navigator.pushNamed(context, SignUpScreen.routeName);
        },
      ),
    );
  }

  // handling facebookauth
  Future handleFacebookAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      facebookController.reset();
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          facebookController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        facebookController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

// handling google sigin in
  Future handleGoogleSignIn() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          googleController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

// handle after signin
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 1000)).then((value) {
      Navigator.pushNamed(context, HomeScreen.routeName);
    });
  }
}
