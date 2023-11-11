import 'package:flutter/material.dart';

import '../models/wishlist_model.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishListModel> _wishlistItems = {};

  Map<String, WishListModel> get getWishlistItems {
    return _wishlistItems;
  }

  void addRemoveProductToWishlist({required String productId}) {
    if (_wishlistItems.containsKey(productId)) {
      removeOneItem(productId);
    } else {
      _wishlistItems.putIfAbsent(
          productId,
          () => WishListModel(
              id: DateTime.now().toString(), productId: productId));
    }
    notifyListeners();
  }

  void removeOneItem(String productId) {
    _wishlistItems.remove(productId);
    notifyListeners();
  }
}
