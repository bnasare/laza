import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/screens/authentication/screens/social_auth_screen.dart';
import 'package:laza/widgets/switch.dart';

class Drawers extends StatefulWidget {
  final String username;
  final String profile;
  final String orders;
  const Drawers(
      {super.key,
      required this.username,
      required this.profile,
      required this.orders});

  @override
  State<Drawers> createState() => _DrawersState();
}

class _DrawersState extends State<Drawers> {
  final User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Drawer(
      width: 300,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            ListTile(
                contentPadding: const EdgeInsets.only(top: 10, left: 15),
                leading: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/images/drawer_vector.png'))),
            ListTile(
              leading: Image.asset(widget.profile),
              title: Text(
                widget.username,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
              subtitle: const Text(
                'Verified Profile',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
              ),
              trailing: Container(
                width: 66,
                height: 32,
                decoration: BoxDecoration(
                    color: color.background,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Text(
                    widget.orders,
                    style: const TextStyle(
                        fontSize: 11, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            const ListTile(
              leading: Icon(Icons.wb_sunny_outlined),
              title: Text('Dark Mode'),
              trailing: CustomSwitch(initialState: false),
            ),
            ListTile(
              leading: const Icon(IconlyLight.dangerCircle),
              title: const Text('Account Information'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(IconlyLight.lock),
              title: const Text('Password'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(IconlyLight.bag),
              title: const Text('Order'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(IconlyLight.wallet),
              title: const Text('My Cards'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(IconlyLight.heart),
              title: const Text('Wishlist'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(IconlyLight.setting),
              title: const Text('Settings'),
              onTap: () {},
            ),
            const Spacer(),
            ListTile(
              contentPadding: const EdgeInsets.only(bottom: 20, left: 20),
              leading: Icon(
                user == null ? IconlyLight.login : IconlyLight.logout,
                color: color.onBackground,
              ),
              title: Text(
                user == null ? 'Login' : 'Logout',
                style: TextStyle(color: color.onBackground),
              ),
              onTap: () async {
                if (user == null) {
                  Navigator.pushNamed(context, SocialAuthScreen.routeName);
                  return;
                }
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(
                    context, SocialAuthScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
