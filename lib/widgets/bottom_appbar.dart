
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
      elevation: 30,
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
              _navigateToScreen(context, const HomeScreen());
            },
          ),
          BottomTabItem(
            icon: IconlyLight.heart,
            label: 'Wishlist',
            index: 1,
            color: color,
            isSelected: selectedIndex == 1,
            onTap: () {
              _navigateToScreen(context, const WishlistScreen());
            },
          ),
          BottomTabItem(
            icon: IconlyLight.bag,
            label: 'Cart',
            index: 2,
            color: color,
            isSelected: selectedIndex == 2,
            onTap: () {
              _navigateToScreen(context, const CartScreen());
            },
          ),
          BottomTabItem(
            icon: IconlyLight.wallet,
            label: 'Payment',
            index: 3,
            color: color,
            isSelected: selectedIndex == 3,
            onTap: () {
              _navigateToScreen(context, const PaymentDetailsScreen());
            },
          ),
        ],
      ),
    );
  }
}

Future<void> _navigateToScreen(
    BuildContext context, Widget targetScreen) async {
  await Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return targetScreen;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(
          CurveTween(curve: curve),
        );
        var offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    ),
  );
}
