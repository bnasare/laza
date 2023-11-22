import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/firebase_options.dart';
import 'package:laza/providers/internet_provider.dart';
import 'package:laza/providers/review_provider.dart';
import 'package:laza/providers/sign_in_provider.dart';
import 'package:laza/screens/authentication/screens/social_auth_screen.dart';
import 'package:laza/screens/home_screen.dart';
import 'package:laza/screens/onboarding_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'consts/app_routes.dart';
import 'consts/theme.dart';
import 'providers/cart_provider.dart';
import 'providers/order_provider.dart';
import 'providers/product_provider.dart';
import 'providers/wishlist_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool firstLaunch = prefs.getBool("first_launch") ?? true;
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    GoogleFonts.config.allowRuntimeFetching = false;
    runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(
          firstLaunch: firstLaunch,
        ),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  final bool firstLaunch;
  const MyApp({Key? key, required this.firstLaunch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => WishlistProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignInProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ReviewProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => OrdersProvider(),
        )
      ],
      child: MaterialApp(
          theme: themeData(),
          debugShowCheckedModeBanner: false,
          routes: AppRoutes().getRoutes(),
          initialRoute: firstRoute(firstLaunch)
          // home: const HomeScreen(),
          ),
    );
  }
}

String firstRoute(bool firstLaunch) {
  if (firstLaunch) {
    return OnboardingScreen.routeName;
  } else {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return HomeScreen.routeName;
    } else {
      return SocialAuthScreen.routeName;
    }
  }
}
