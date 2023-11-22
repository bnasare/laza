import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/wishlist_model.dart';

class WishlistProvider with ChangeNotifier {
  final Map<String, WishListModel> _wishlistItems = {};

  Map<String, WishListModel> get getWishlistItems {
    return _wishlistItems;
  }

  Future<void> toggleWishlist(
      {required String productId, required BuildContext context}) async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    final wishlistId = const Uuid().v4();

    try {
      if (_wishlistItems.containsKey(productId)) {
        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          'userWishList': FieldValue.arrayRemove([
            {
              'productId': productId,
              'wishlistId': _wishlistItems[productId]!.id,
            }
          ])
        });
        await fetchWishList();
        _wishlistItems.remove(productId);
        log('Item has been removed from your wishlist');
      } else {
        await FirebaseFirestore.instance.collection('users').doc(uid).update({
          'userWishList': FieldValue.arrayUnion([
            {
              'wishlistId': wishlistId,
              'productId': productId,
            }
          ])
        });
        await fetchWishList();
        _wishlistItems.putIfAbsent(
          productId,
          () => WishListModel(
            id: DateTime.now().toString(),
            productId: productId,
          ),
        );
        log('Item has been added to your wishlist');
      }
      notifyListeners();
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error.toString())),
      );
    }
  }

  Future<void> fetchWishList() async {
    final User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;

    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    // ignore: unnecessary_null_comparison
    if (userDoc == null) {
      return;
    }
    final noOfWishlistItems = userDoc.get('userWishList').length;
    for (int i = 0; i < noOfWishlistItems; i++) {
      _wishlistItems.putIfAbsent(
          userDoc.get('userWishList')[i]['productId'],
          () => WishListModel(
                id: userDoc.get('userWishList')[i]['wishlistId'],
                productId: userDoc.get('userWishList')[i]['productId'],
              ));
    }
    notifyListeners();
  }

  /// Add to Firebase wishlist
  // Future<void> addToWishList(
  //     {required String productId, required BuildContext context}) async {
  //   final User? user = FirebaseAuth.instance.currentUser;
  //   final uid = user!.uid;
  //   final wishlistId = const Uuid().v4();
  //   try {
  //     FirebaseFirestore.instance.collection('users').doc(uid).update({
  //       'userWishList': FieldValue.arrayUnion([
  //         {
  //           'wishlistId': wishlistId,
  //           'productId': productId,
  //         }
  //       ])
  //     });
  //     await Fluttertoast.showToast(
  //       msg: "Item has been added to your wishlist",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //     );
  //   } catch (error) {
  //     await Fluttertoast.showToast(
  //       msg: "Error: $error",
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.CENTER,
  //     );
  //   }
  // }

  // Future<void> removeOneItem(
  //   String productId,
  // ) async {
  //   final User? user = FirebaseAuth.instance.currentUser;
  //   String uid = user!.uid;
  //   await FirebaseFirestore.instance.collection('users').doc(uid).update({
  //     'userWishList': FieldValue.arrayRemove([
  //       {
  //         'productId': productId,
  //         'wishlistId': _wishlistItems[productId]!.id,
  //       }
  //     ])
  //   });
  //   _wishlistItems.remove(productId);
  //   await fetchWishList();
  //   notifyListeners();
  // }
}
