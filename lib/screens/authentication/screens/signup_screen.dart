import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/screens/home_screen.dart';

import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../../../widgets/switch.dart';
import '../widgets/auth_text_field.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup';

  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  Future<void> signUp() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        fullNameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all the fields.')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.toLowerCase().trim(),
          password: passwordController.text.trim());
      final User? user = FirebaseAuth.instance.currentUser;
      final uid = user!.uid;
      user.updateDisplayName(fullNameController.text);
      user.reload();
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'id': uid,
        'name': fullNameController.text,
        'email': emailController.text.toLowerCase(),
        'userWishList': [],
        'userCartItems': [],
        'createdAt': Timestamp.now(),
      });
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      log('Successfully registered');
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.message.toString())),
      );
    } finally {
      emailController.clear();
      passwordController.clear();
      fullNameController.clear();
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
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                color: color.secondary,
                fontSize: 28,
                fontWeight: FontWeight.w600,
                letterSpacing: -0.21,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 35),
              child: Column(children: [
                AuthTextField(
                  textInputAction: TextInputAction.next,
                  controller: fullNameController,
                  labelText: "Username",
                  trailingWidget: Icon(
                    Icons.check_outlined,
                    color: color.onSecondary,
                  ),
                ),
                AuthTextField(
                  textInputAction: TextInputAction.next,
                  controller: passwordController,
                  labelText: "Password",
                  trailingText: "Strong",
                ),
                AuthTextField(
                  textInputAction: TextInputAction.done,
                  controller: emailController,
                  labelText: "Email Address",
                  trailingWidget: Icon(
                    Icons.check_outlined,
                    color: color.onSecondary,
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Remember me",
                    style: GoogleFonts.manrope(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const CustomSwitch(initialState: true),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationCard(
          text: 'Sign Up',
          onTap: () async {
            await signUp();
          }),
    );
  }
}
