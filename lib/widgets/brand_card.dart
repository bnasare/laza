import 'package:flutter/material.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.assetName,
    required this.brandName,
    required this.width,
  });

  final String assetName;
  final String brandName;
  final double width;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
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

    return Container(
      height: verticalConverter(50),
      width: width,
      decoration: BoxDecoration(
          color: color.background, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: horizontalConverter(10)),
            child: Container(
              width: horizontalConverter(40),
              height: verticalConverter(40),
              decoration: BoxDecoration(
                  color: color.onPrimary,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset('assets/images/$assetName.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: horizontalConverter(10)),
            child: Text(
              brandName,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
