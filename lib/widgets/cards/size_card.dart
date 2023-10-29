import 'package:flutter/material.dart';

import '../../consts/sizing_config.dart';

class SizeCard extends StatelessWidget {
  const SizeCard({super.key, required this.size});

  final String size;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Container(
      height: verticalConverter(context, 60),
      width: horizontalConverter(context, 60),
      decoration: BoxDecoration(
          color: color.background, borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: Text(
          size,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
