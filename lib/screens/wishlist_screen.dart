import 'package:flutter/material.dart';

import '../widgets/bottom_appbar.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
      bottomNavigationBar: CustomBottomNavigation(selectedIndex: 1),
    );
  }
}
