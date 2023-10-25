import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

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
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    bool isSwitched = false;
    return Drawer(
      width: 300,
      child: ListView(
        children: <Widget>[
          ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Image.asset('assets/images/drawer_vector.png')),
          ListTile(
            leading: Image.asset(widget.profile),
            title: Text(
              widget.username,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
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
          ListTile(
            leading: const Icon(Icons.wb_sunny_outlined),
            title: const Text('Dark Mode'),
            trailing: Switch(
                value: isSwitched,
                onChanged: (value) {
                  setState(() {
                    isSwitched = value; // Update the switch state
                  });
                }),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(IconlyLight.dangerCircle),
            title: const Text('Account Information'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(IconlyLight.lock),
            title: const Text('Password'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(IconlyLight.bag),
            title: const Text('Order'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(IconlyLight.wallet),
            title: const Text('My Cards'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(IconlyLight.heart),
            title: const Text('Wishlist'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(IconlyLight.setting),
            title: const Text('Settings'),
          ),
          const Spacer(),
          ListTile(
            onTap: () {},
            leading: Icon(
              IconlyLight.logout,
              color: color.onBackground,
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: color.onBackground),
            ),
          ),
        ],
      ),
    );
  }
}
