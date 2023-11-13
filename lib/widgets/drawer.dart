import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/screens/authentication/screens/social_auth_screen.dart';
import 'package:laza/widgets/switch.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
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
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  user?.photoURL ??
                      'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png?20150327203541',
                ),
              ),
              title: Text(
                user?.displayName ?? 'Username',
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
                child: const Center(
                  child: Text(
                    '3 Orders',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
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
