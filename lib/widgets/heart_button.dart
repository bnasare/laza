import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';

import '../providers/wishlist_provider.dart';

class HeartButton extends StatelessWidget {
  const HeartButton(
      {Key? key, required this.productId, this.isInWishlist = false})
      : super(key: key);
  final String productId;
  final bool? isInWishlist;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    return GestureDetector(
      onTap: () {
        wishlistProvider.addRemoveProductToWishlist(productId: productId);
      },
      child: Icon(
        isInWishlist != null && isInWishlist == true
            ? IconlyBold.heart
            : IconlyLight.heart,
        color: isInWishlist != null && isInWishlist == true
            ? color.primary
            : color.tertiary,
      ),
    );
  }
}
