import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts/sizing_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.assetName,
    required this.productName,
    required this.price,
  });

  final String assetName;
  final String productName;
  final int price;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      height: verticalConverter(context, 257),
      width: horizontalConverter(context, 160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: verticalConverter(context, 203),
                width: horizontalConverter(context, 160),
                decoration: BoxDecoration(
                  color: color.background,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/$assetName.png',
                    height: verticalConverter(context, 203),
                    width: horizontalConverter(context, 160),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  icon: Icon(
                    CupertinoIcons.heart,
                    color: color.tertiary,
                    size: 25,
                  ),
                  onPressed: (){},
                )
              ),
            ],
          ),
          Text(
            productName,
            softWrap: true,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
          Text(
            '\$ $price',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
