import 'package:flutter/material.dart';

import '../consts/sizing_config.dart';

class ProductImage extends StatelessWidget {
  const ProductImage(
      {super.key,
      required this.firstImage,
      required this.secondImage,
      required this.thirdImage,
      required this.fourthImage});

  final String firstImage;
  final String secondImage;
  final String thirdImage;
  final String fourthImage;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return Row(
      children: [
        Container(
          width: horizontalConverter(context, 77),
          height: verticalConverter(context, 77),
          decoration: BoxDecoration(
            color: color.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            'assets/images/product_images/$firstImage.png',
            fit: BoxFit.contain,
            width: horizontalConverter(context, 77),
            height: verticalConverter(context, 77),
          ),
        ),
        const Spacer(),
        Container(
          width: horizontalConverter(context, 77),
          height: verticalConverter(context, 77),
          decoration: BoxDecoration(
              color: color.background, borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            'assets/images/product_images/$secondImage.png',
            fit: BoxFit.contain,
            width: horizontalConverter(context, 77),
            height: verticalConverter(context, 77),
          ),
        ),
        const Spacer(),
        Container(
          width: horizontalConverter(context, 77),
          height: verticalConverter(context, 77),
          decoration: BoxDecoration(
              color: color.background, borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            'assets/images/product_images/$thirdImage.png',
            fit: BoxFit.contain,
            width: horizontalConverter(context, 77),
            height: verticalConverter(context, 77),
          ),
        ),
        const Spacer(),
        Container(
          width: horizontalConverter(context, 77),
          height: verticalConverter(context, 77),
          decoration: BoxDecoration(
              color: color.background, borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            'assets/images/product_images/$fourthImage.png',
            fit: BoxFit.contain,
            width: horizontalConverter(context, 77),
            height: verticalConverter(context, 77),
          ),
        ),
      ],
    );
  }
}
