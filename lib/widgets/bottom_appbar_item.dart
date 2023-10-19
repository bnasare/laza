import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;
  final ColorScheme color;
  final Function() onTap;
  final bool isSelected;

  const TabItem({
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
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!isSelected)
            Icon(
              icon,
              color: color.secondary,
            ),
          if (!isSelected) const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              color: isSelected ? color.onTertiary : color.onSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
