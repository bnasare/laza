import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/screens/authentication/screens/forgot_password_screen.dart';
import 'package:laza/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../../../widgets/switch.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
//const LoginScreen({Key? key}) : super(key: key);
TextEditingController emailController=TextEditingController();
TextEditingController passwordController=TextEditingController();

  bool rememberMe = false;


  @override
  void initState() {
    super.initState();
    loadSavedCredentials(emailController, passwordController, rememberMe);
  }

void loadSavedCredentials( emailController,
     passwordController,  rememberMe) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? email = prefs.getString('email');
  String? password = prefs.getString('password');
  bool? remember = prefs.getBool('remember');

  if (email != null && password != null && remember != null) {
    emailController.text = email;
    passwordController.text = password;
    rememberMe = remember;
  }
}

void saveCredentials(String email, String password, bool rememberMe) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (rememberMe) {
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setBool('remember', true);
  } else {
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.setBool('remember', false);
  }
}


void signUsersIn() async {
   
  showDialog(context: context, builder:(context){
return const Center(
  child: CircularProgressIndicator(),
);
  });

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    Navigator.pushReplacementNamed(context, HomeScreen.routeName);

     if (rememberMe) {
          saveCredentials(
            emailController.text,
            passwordController.text,
            rememberMe,
          );}
  } catch (e) {
    Navigator.pop(context);
   
   showDialog(context: context, builder:(context){
return const AlertDialog(
  title: Text('Sign-In error'),
);
  });
   
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: "Welcome\n",
                      style: TextStyle(
                        color: color.secondary,
                        fontSize: 28,
                        fontWeight: FontWeight.w600,
                        height: 0,
                        letterSpacing: -0.21,
                      ),
                      children: [
                        TextSpan(
                          text: "Please enter your data to continue",
                          style: TextStyle(
                            color: color.tertiary,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AuthTextField(
                          controller: emailController,
                          labelText: "Username",
                          trailingWidget: const Icon(
                            Icons.check_outlined,
                          ),
                        ),
                        AuthTextField(
                          controller: passwordController,
                          labelText: "Password",
                          trailingText: "Strong",
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, ForgotPasswordScreen.routeName);
                              },
                              child: Text(
                                "Forgot password?",
                                style: TextStyle(
                                  color: color.onBackground,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Remember me",
                                style: GoogleFonts.manrope(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                               CustomSwitch(initialState:rememberMe ),
                            ],
                          ),
                        ),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text:
                          "By connecting you account, confirm that you agree with our",
                      style: TextStyle(
                        color: color.tertiary,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: " Terms and conditions",
                          style: TextStyle(
                            color: color.secondary,
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
        ),
        bottomNavigationBar: NavigationCard(
            text: 'Login',
            onTap: () {signUsersIn();
            
           //   Navigator.pushReplacementNamed(context, HomeScreen.routeName);
            }));
  }
  
}