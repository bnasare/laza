import 'package:flutter/material.dart';

import '../consts/sizing_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.assetName,
    this.firstLine,
    this.price,
    this.secondLine,
  });

  final String assetName;
  final String? firstLine;
  final String? secondLine;
  final int? price;

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: verticalConverter(context, 257),
      width: horizontalConverter(context, 160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            child: Image.asset(
              'assets/images/$assetName.jpg',
              height: verticalConverter(context, 203),
              width: horizontalConverter(context, 160),
              fit: BoxFit.cover,
            ),
          ),
          firstLine != null
          ? Text(
            firstLine!,
            softWrap: true,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          )
          : const SizedBox(),
          secondLine != null
          ?Text(
            secondLine!,
            softWrap: true,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          )
          : const SizedBox(),
          price != null
          ?Text(
            '\$ ${price!}',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          )
              : const SizedBox()
        ],
      ),
    );
  }
}
