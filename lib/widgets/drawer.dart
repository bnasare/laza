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
              leading: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/images/drawer_vector.png'))),
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
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(IconlyLight.dangerCircle),
              title: Text('Account Information'),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(IconlyLight.lock),
              title: Text('Password'),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(IconlyLight.bag),
              title: Text('Order'),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(IconlyLight.wallet),
              title: Text('My Cards'),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(IconlyLight.heart),
              title: Text('Wishlist'),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const ListTile(
              leading: Icon(IconlyLight.setting),
              title: Text('Settings'),
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: ListTile(
              leading: Icon(
                IconlyLight.logout,
                color: color.onBackground,
              ),
              title: Text(
                'Logout',
                style: TextStyle(color: color.onBackground),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
