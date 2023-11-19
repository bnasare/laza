import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  final Color backgroundColor;
  final Function()? onPressed;
  const CustomBackButton(
      {super.key, required this.backgroundColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Material(
      shape: const CircleBorder(),
      color: backgroundColor,
      child: BackButton(
        onPressed: onPressed ??
                () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
        color: color.secondary,
      ),
    );
  }
}