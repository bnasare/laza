import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/screens/product_details_screen.dart';

import '../../consts/sizing_config.dart';

class ProductCard extends StatefulWidget {
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
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName);
      },
      child: SizedBox(
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
                      'assets/images/${widget.assetName}.png',
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
                    icon: _isLiked == false
                        ? Icon(
                            IconlyLight.heart,
                            color: color.tertiary,
                            size: 25,
                          )
                        : Icon(
                            IconlyLight.heart,
                            color: color.onBackground,
                            size: 25,
                          ),
                    onPressed: () {
                      setState(() {
                        _isLiked = !_isLiked;
                      });
                    },
                  ),
                ),
              ],
            ),
            Text(
              widget.productName,
              softWrap: true,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
            Text(
              '\$ ${widget.price}',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
