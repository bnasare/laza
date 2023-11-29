import 'package:flutter/material.dart';

import '../../consts/sizing_config.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({super.key, required this.size, required this.isSelected});

  final String size;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      height: verticalConverter(context, 60),
      width: horizontalConverter(context, 60),
      decoration: BoxDecoration(
        color: isSelected ? color.primary : color.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: isSelected ? color.onPrimary : color.secondary,
          ),
        ),
      ),
    );
  }
}
