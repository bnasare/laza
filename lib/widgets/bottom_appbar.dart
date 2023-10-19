import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/screens/cart_screen.dart';
import 'package:laza/screens/payment_details_screen.dart';
import 'package:laza/screens/wishlist_screen.dart';

import '../screens/home_screen.dart';
import 'bottom_appbar_item.dart';

class CustomBottomAppBar extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomAppBar({
    Key? key,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return BottomAppBar(
      height: 70,
      elevation: 0,
      color: color.surface,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TabItem(
            icon: IconlyLight.home,
            label: 'Home',
            index: 0,
            color: color,
            isSelected: selectedIndex == 0,
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          TabItem(
            icon: IconlyLight.heart,
            label: 'Wishlist',
            index: 1,
            color: color,
            isSelected: selectedIndex == 1,
            onTap: () {
              Navigator.pushNamed(context, WishlistScreen.routeName);
            },
          ),
          TabItem(
            icon: IconlyLight.bag,
            label: 'Cart',
            index: 2,
            color: color,
            isSelected: selectedIndex == 2,
            onTap: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          TabItem(
            icon: IconlyLight.profile,
            label: 'Payment',
            index: 3,
            color: color,
            isSelected: selectedIndex == 3,
            onTap: () {
              Navigator.pushNamed(context, PaymentDetailsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
