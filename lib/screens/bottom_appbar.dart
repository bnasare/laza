import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/screens/cart_screen.dart';
import 'package:laza/screens/payment_details_screen.dart';
import 'package:laza/screens/wishlist_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import 'home_screen.dart';

class BottomBarScreen extends StatefulWidget {
  static const routeName = '/bottom_bar';
  const BottomBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const WishlistScreen(),
      const CartScreen(),
      const PaymentDetailsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyLight.home),
        title: 'Home',
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(IconlyLight.heart),
        title: 'Wishlist',
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        title: 'Cart',
        icon: const Icon(IconlyLight.bag),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        title: 'Payment',
        icon: const Icon(IconlyLight.wallet),
        activeColorPrimary: Theme.of(context).colorScheme.primary,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  late PersistentTabController controller;

  @override
  void initState() {
    super.initState();
    controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      navBarHeight: 70,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style9,
    );
  }
}
