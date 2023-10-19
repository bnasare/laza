import 'package:flutter/material.dart';

class AllProductsScreen extends StatelessWidget {
  static const routeName = '/all_products';

  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Flutter is dope"),
      ),
    );
  }
}
