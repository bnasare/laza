import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:laza/screens/product_details_screen.dart';

import '../../consts/sizing_config.dart';
import '../../models/product_model.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    super.key,
    required this.product,
  });

  final Product product;

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ProductDetailsScreen(product: widget.product);
            },
          ),
        );
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
                      widget.product.imagePath,
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
              widget.product.productName,
              softWrap: true,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
            Text(
              '\$ ${widget.product.price}',
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
