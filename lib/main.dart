import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/firebase_options.dart';
import 'package:laza/provider/internet_provider.dart';
import 'package:laza/provider/sign_in_provider.dart';
import 'package:laza/screens/authentication/screens/signup_screen.dart';
import 'package:laza/screens/authentication/screens/social_auth_screen.dart';
import 'package:laza/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'consts/app_routes.dart';
import 'consts/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    GoogleFonts.config.allowRuntimeFetching = false;
    runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetProvider(),
        )
      ],
      child: MaterialApp(
        theme: themeData(),
        debugShowCheckedModeBanner: false,
        routes: AppRoutes().getRoutes(),
        initialRoute: SocialAuthScreen.routeName,
      ),
    );
  }
}
