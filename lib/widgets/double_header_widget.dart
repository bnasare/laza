import 'package:flutter/material.dart';

import '../consts/sizing_config.dart';

class DoubleHeader extends StatelessWidget {
  const DoubleHeader({
    super.key,
    required this.firstText,
    required this.secondText,
    this.onTap,
  });

  final String firstText;
  final String secondText;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(left: horizontalConverter(context, 20)),
          child: Text(
            firstText,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: color.secondary),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: horizontalConverter(context, 20)),
          child: GestureDetector(
            onTap: onTap,
            child: Text(
              secondText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: color.tertiary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
