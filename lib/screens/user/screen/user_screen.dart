import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../orders/orders_screen.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../../../wishlist/wishlist_screen.dart';
import '../widgets/user_grid_card.dart';

class UserScreen extends StatelessWidget {
  static const routeName = "/user_screen";

  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
        title: Text(
          'User',
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: color.secondary),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 25,
          childAspectRatio: 3 / 4,
          children: [
            UserGridCard(
              icon: IconlyLight.dangerCircle,
              name: "Account Information",
              function: () {},
            ),
            UserGridCard(
              icon: IconlyLight.lock,
              name: "Password",
              function: () {},
            ),
            UserGridCard(
              icon: IconlyLight.bag,
              name: "Orders",
              function: () {
                Navigator.pushNamed(context, OrdersScreen.routeName);
              },
            ),
            UserGridCard(
              icon: IconlyLight.heart,
              name: "Wishlist",
              function: () {
                Navigator.pushNamed(context, WishlistScreen.routeName);
              },
            ),
            UserGridCard(
              icon: IconlyLight.setting,
              name: "Settings",
              function: () {
                //todo:Navigate to settings screen
              },
            ),
            UserGridCard(
              name: "Dark Mode",
              icon: Icons.wb_sunny_outlined,
              function: () {},
            )
          ],
        ),
      ),
    );
  }
}
