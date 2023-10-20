import 'package:flutter/material.dart';

class NavigationCard extends StatelessWidget {
  const NavigationCard({super.key, required this.text, required this.onTap});

  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        color: color.primary,
        height: 75,
        width: double.infinity,
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              text,
              style: TextStyle(
                  color: color.onPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
