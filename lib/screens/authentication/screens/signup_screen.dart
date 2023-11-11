import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/provider/internet_provider.dart';
import 'package:laza/screens/authentication/screens/login_screen.dart';
import 'package:laza/screens/home_screen.dart';
import 'package:laza/provider/sign_in_provider.dart';
import 'package:laza/utils/snack_bar.dart';
import 'package:provider/provider.dart';
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
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
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
                    controller: TextEditingController(),
                    labelText: "Username",
                    trailingWidget: Icon(
                      Icons.check_outlined,
                      color: color.onSecondary,
                    ),
                  ),
                  AuthTextField(
                    controller: passwordController,
                    labelText: "Password",
                    trailingText: "Strong",
                  ),
                  AuthTextField(
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
            onTap: () {
              handleEmailSignUp(
                  emailController.text, passwordController.text, context);
              Navigator.pushNamed(context, HomeScreen.routeName);
            }));
  }
}

Future<void> handleEmailSignUp(
    String email, String password, BuildContext context) async {
  final sp = context.read<SignInProvider>();
  final ip = context.read<InternetProvider>();
  await ip.checkInternetConnection();

  if (ip.hasInternet == false) {
    openSnackbar(context, "Check your Internet connection", Colors.red);
    // Reset your form controllers or UI elements
  } else {
    try {
      await sp.signUpWithEmailAndPassword(email, password);

      if (sp.hasError == true) {
        openSnackbar(context, sp.errorCode.toString(), Colors.red);
        // Reset your form controllers or UI elements
      } else {
        // User signed up successfully
        handleAfterSignUp(context);
      }
    } catch (e) {
      // Handle sign-up errors here
      openSnackbar(context, e.toString(), Colors.red);
      // Reset your form controllers or UI elements
    }
  }
}

handleAfterSignUp(BuildContext context) {
  Future.delayed(const Duration(milliseconds: 1000)).then((value) {
    // Navigate to the desired screen after successful sign-up
    Navigator.pushNamed(context, HomeScreen.routeName);
  });
}
