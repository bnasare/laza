import 'package:flutter/material.dart';

class UserGridCard extends StatelessWidget {
  const UserGridCard(
      {super.key,
      required this.icon,
      required this.name,
      required this.function});
  final IconData icon;
  final String name;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          color: color.background,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color.primary,
              size: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
