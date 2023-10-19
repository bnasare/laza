import 'package:flutter/material.dart';

import '../widgets/bottom_appbar.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
      bottomNavigationBar: CustomBottomNavigation(selectedIndex: 0),
    );
  }
}
