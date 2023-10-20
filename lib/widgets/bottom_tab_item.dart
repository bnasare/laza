import 'package:flutter/material.dart';

class BottomTabItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final ColorScheme color;
  final Function() onTap;
  final bool isSelected;

  const BottomTabItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.index,
    required this.color,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isSelected)
            Icon(
              icon,
              color: isSelected ? color.secondary : color.tertiary,
              size: 30,
            ),
          if (isSelected)
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? color.primary : color.onSecondary,
              ),
            ),
        ],
      ),
    );
  }
}
