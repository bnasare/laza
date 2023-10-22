import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laza/screens/home_screen.dart';
import 'package:laza/screens/order_confirmed_screen.dart';

import 'consts/app_routes.dart';
import 'consts/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    GoogleFonts.config.allowRuntimeFetching = false;
    runApp(
      // DevicePreview(
      //   enabled: !kReleaseMode,
      // builder: (context) =>
      const MyApp(),
      // ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles().themeData(context),
      debugShowCheckedModeBanner: false,
      routes: AppRoutes().getRoutes(),
      initialRoute: HomeScreen.routeName,
    );
  }
}
