import 'package:flutter/material.dart';

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
    double verticalConverter(double value) {
      double height = MediaQuery.of(context).size.height;
      double heightRatio = height / 812;
      double newValue = heightRatio * value;
      return newValue;
    }

    double horizontalConverter(double value) {
      double width = MediaQuery.of(context).size.width;
      double widthRatio = width / 375;
      double newValue = widthRatio * value;
      return newValue;
    }

    return SizedBox(
      height: verticalConverter(257),
      width: horizontalConverter(160),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/$assetName.png',
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
