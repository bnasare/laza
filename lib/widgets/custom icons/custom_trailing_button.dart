import 'package:flutter/material.dart';
import 'package:laza/cart/cart_screen.dart';

class CustomTrailingButton extends StatelessWidget {
  final Color backgroundColor;
  final IconData icon;
  const CustomTrailingButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CartScreen.routeName);
      },
      child: Material(
        shape: const CircleBorder(),
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Icon(icon, color: color.secondary),
        ),
      ),
    );
  }
}
