import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/widgets/bottom_appbar.dart';

import '../../../widgets/custom_back_button.dart';
import '../../../widgets/custom_trailing_button.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/wishlist';

  const WishlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, bottom: 0),
            child: CustomTrailingButton(
              backgroundColor: color.background,
              icon: IconlyLight.bag,
            ),
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavigation(selectedIndex: 1),
    );
  }
}
