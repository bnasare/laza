import 'package:flutter/material.dart';

import '../consts/sizing_config.dart';

class DoubleHeader extends StatelessWidget {
  const DoubleHeader(
      {super.key, required this.firstText, required this.secondText});

  final String firstText;
  final String secondText;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(left: horizontalConverter(context, 20)),
          child: Text(
            firstText,
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: color.secondary
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: EdgeInsets.only(right: horizontalConverter(context, 20)),
          child: Text(
            secondText,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: color.tertiary,
            ),
          ),
        ),
      ],
    );
  }
}
