import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/providers/wishlist_provider.dart';
import 'package:laza/screens/authentication/screens/forgot_password_screen.dart';
import 'package:laza/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/cart_provider.dart';
import '../../../providers/order_provider.dart';
import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../widgets/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _lights = false;
  final String switchKey = 'switchState';

  @override
  void initState() {
    super.initState();
    loadlightState();
    loadLogins();
  }

  saveSwitchState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(switchKey, value);
  }

  loadlightState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _lights = prefs.getBool(switchKey) ?? false;
    });
  }

  saveLogins() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', emailController.text);
    await prefs.setString('password', passwordController.text);

    print('saved!!!');
  }

  void signUsersIn() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      emailController.clear();
      passwordController.clear();

      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    } catch (e) {
      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text('Sign-In error'),
        ),
      );
    }
  }

  loadLogins() async {
    final prefs = await SharedPreferences.getInstance();
    final String savedEmail = prefs.getString('email') ?? "";
    final String savedPassword = prefs.getString('password') ?? "";

    setState(() {
      emailController = TextEditingController(text: savedEmail);
      passwordController = TextEditingController(text: savedPassword);
    });
    log(savedEmail);
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
                        labelText: "Email",
                        trailingWidget: const Icon(
                          Icons.check_outlined,
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                      AuthTextField(
                        controller: passwordController,
                        labelText: "Password",
                        // trailingText: "Strong",
                        textInputAction: TextInputAction.done,
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
                            CupertinoSwitch(
                              value: _lights,
                              activeColor:
                                  Theme.of(context).colorScheme.onSecondary,
                              onChanged: (bool value) {
                                setState(() {
                                  _lights = value;
                                  saveSwitchState(value);
                                });
                              },
                            ),
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
        onTap: () async {
          try {
            signUsersIn();
            final ordersProvider =
                Provider.of<OrdersProvider>(context, listen: false);
            final cartProvider =
                Provider.of<CartProvider>(context, listen: false);
            final wishlistProvider =
                Provider.of<WishlistProvider>(context, listen: false);

            await ordersProvider.fetchOrders();
            await cartProvider.fetchCart();
            await wishlistProvider.fetchWishList();
          } catch (e) {
            print(e);
          }

          if (_lights == true) {
            saveLogins();
            loadLogins();
          }
        },
      ),
    );
  }
}
