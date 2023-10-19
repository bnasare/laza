import 'package:flutter/material.dart';

import '../widgets/bottom_appbar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
      bottomNavigationBar: CustomBottomAppBar(selectedIndex: 2),
    );
  }
}
