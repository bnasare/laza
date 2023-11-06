import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:laza/screens/authentication/screens/signup_screen.dart';
import 'package:laza/screens/home_screen.dart';

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
  Future<UserCredential?> signInWithGoogle(context) async {
    try {
      log("Google Sign-In started");
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // signInWithCredential returns a UserCredential object
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Now you can access the user property
      final user = userCredential.user;

      if (userCredential.additionalUserInfo!.isNewUser) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .set({
          'id': user.uid,
          'name': user.displayName,
          'email': user.email,
        });
      }

      log("Google Sign-In successful");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      return userCredential;
    } on FirebaseException catch (error) {
      log("FirebaseException: ${error.message}");
      AlertDialogs.errorDialog(subtitle: '${error.message}', context: context);
      return null;
    } catch (error) {
      log("Error: $error");
      AlertDialogs.errorDialog(subtitle: '$error', context: context);
      return null;
    }
  }

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
            Column(children: [
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
                      onTap: () {
                        signInWithGoogle(context);
                      }))
            ]),
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
}

class AlertDialogs {
  static void errorDialog({required String subtitle, required context}) {}
}
