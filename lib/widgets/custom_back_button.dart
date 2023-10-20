import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color backgroundColor;
  const CustomBackButton({super.key, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Material(
      shape: const CircleBorder(),
      color: backgroundColor,
      child: BackButton(
        onPressed: () {},
        color: color.secondary,
      ),
    );
  }
}
