import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/screens/cart_screen.dart';
import 'package:laza/screens/payment_details_screen.dart';
import 'package:laza/screens/wishlist_screen.dart';

import '../screens/home_screen.dart';
import 'bottom_tab_item.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNavigation({
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
          BottomTabItem(
            icon: IconlyLight.home,
            label: 'Home',
            index: 0,
            color: color,
            isSelected: selectedIndex == 0,
            onTap: () {
              Navigator.pushNamed(context, HomeScreen.routeName);
            },
          ),
          BottomTabItem(
            icon: IconlyLight.heart,
            label: 'Wishlist',
            index: 1,
            color: color,
            isSelected: selectedIndex == 1,
            onTap: () {
              Navigator.pushNamed(context, WishlistScreen.routeName);
            },
          ),
          BottomTabItem(
            icon: IconlyLight.bag,
            label: 'Cart',
            index: 2,
            color: color,
            isSelected: selectedIndex == 2,
            onTap: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          BottomTabItem(
            icon: IconlyLight.wallet,
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
