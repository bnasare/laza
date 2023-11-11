import 'package:flutter/material.dart';
import 'package:laza/screens/product_details_screen.dart';
import 'package:laza/widgets/heart_button.dart';
import 'package:provider/provider.dart';

import '../../consts/sizing_config.dart';
import '../models/wishlist_model.dart';
import '../providers/product_provider.dart';
import '../providers/wishlist_provider.dart';

class WishlistWidget extends StatefulWidget {
  const WishlistWidget({
    super.key,
  });

  @override
  State<WishlistWidget> createState() => _WishlistWidgetState();
}

class _WishlistWidgetState extends State<WishlistWidget> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final productProvider = Provider.of<ProductProvider>(context);
    final wishlistModel = Provider.of<WishListModel>(context);
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    final getCurrProduct =
        productProvider.findProdById(wishlistModel.productId);
    bool? isInWishlist =
        wishlistProvider.getWishlistItems.containsKey(getCurrProduct.id);

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName,
            arguments: getCurrProduct.id);
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
                      getCurrProduct.imagePath,
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
                    productId: getCurrProduct.id,
                    isInWishlist: isInWishlist,
                  ),
                ),
              ],
            ),
            Text(
              getCurrProduct.name,
              softWrap: true,
              maxLines: 2,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 11,
              ),
            ),
            Text(
              '\$ ${getCurrProduct.price.toStringAsFixed(2)}',
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
