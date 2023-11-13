import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:laza/screens/home_screen.dart';
import 'package:laza/screens/onboarding_screen.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late bool isLoading;
  late Stream<User?> authStateStream;

  @override
  void initState() {
    super.initState();
    isLoading = true;
    authStateStream = FirebaseAuth.instance.authStateChanges();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    // ignore: unused_local_variable
    User? user = FirebaseAuth.instance.currentUser;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(body: Container())
        : StreamBuilder<User?>(
            stream: authStateStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                User? user = snapshot.data;
                if (user != null) {
                  return const HomeScreen();
                }
              }
              return const OnboardingScreen();
            },
          );
  }
}
