import 'package:flutter/material.dart';
import 'package:laza/screens/product_details_screen.dart';
import 'package:laza/widgets/heart_button.dart';
import 'package:provider/provider.dart';

import '../../consts/sizing_config.dart';
import '../../models/product_model.dart';
import '../../providers/wishlist_provider.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({
    super.key,
  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final productModel = Provider.of<ProductModel>(context);
    final wishListProvider = Provider.of<WishlistProvider>(context);
    bool? isInWishList =
        wishListProvider.getWishlistItems.containsKey(productModel.id);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName,
            arguments: productModel.id);
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
                      productModel.imagePath,
                      height: verticalConverter(context, 203),
                      width: horizontalConverter(context, 160),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: HeartButton(
                    productId: productModel.id,
                    isInWishlist: isInWishList,
                  ),
                ),
              ],
            ),
            Text(
              productModel.name,
              softWrap: true,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
            Text(
              '\$ ${productModel.price.toStringAsFixed(2)}',
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
