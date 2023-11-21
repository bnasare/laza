import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

import '../models/cart_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, CartModel> _cartItems = {};

  Map<String, CartModel> get getCartItems {
    return _cartItems;
  }

  Future<void> addProductsToCart({
    required String productId,
    required int quantity,
  }) async {
    final User? user = FirebaseAuth.instance.currentUser;
    final uid = user!.uid;
    final cartId = const Uuid().v4();
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'userCartItems': FieldValue.arrayUnion([
          {
            'cartId': cartId,
            'productId': productId,
            'quantity': quantity,
          }
        ])
      });
      _cartItems.putIfAbsent(
        productId,
        () => CartModel(
          id: cartId,
          productId: productId,
          quantity: quantity,
        ),
      );
      notifyListeners();
      log('Item has been added to your cart');
    } catch (error) {
      log(error.toString());
    }
  }

  // Future<void> addToCart(
  //     {required String productId,
  //     required int quantity,
  //     required BuildContext context}) async {
  //   final User? user = FirebaseAuth.instance.currentUser;
  //   final uid = user!.uid;
  //   final cartId = const Uuid().v4();
  //   try {
  //     FirebaseFirestore.instance.collection('users').doc(uid).update({
  //       'userCartItems': FieldValue.arrayUnion([
  //         {
  //           'cartId': cartId,
  //           'productId': productId,
  //           'quantity': quantity,
  //         }
  //       ])
  //     });
  //     await Fluttertoast.showToast(
  //       msg: "Item has been added to your cart",
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

  Future<void> fetchCart() async {
    final User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;

    final DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    // ignore: unnecessary_null_comparison
    if (userDoc == null) {
      return;
    }
    final noOfCartItems = userDoc.get('userCartItems').length;
    for (int i = 0; i < noOfCartItems; i++) {
      _cartItems.putIfAbsent(
          userDoc.get('userCartItems')[i]['productId'],
          () => CartModel(
                id: userDoc.get('userCartItems')[i]['cartId'],
                productId: userDoc.get('userCartItems')[i]['productId'],
                quantity: userDoc.get('userCartItems')[i]['quantity'],
              ));
    }
    notifyListeners();
  }

  Future<void> removeOneItem(
    String productId,
  ) async {
    final User? user = FirebaseAuth.instance.currentUser;
    String uid = user!.uid;
    await FirebaseFirestore.instance.collection('users').doc(uid).update({
      'userCartItems': FieldValue.arrayRemove([
        {
          'productId': productId,
          'cartId': _cartItems[productId]!.id,
          'quantity': _cartItems[productId]!.quantity
        }
      ])
    });
    _cartItems.remove(productId);
    await fetchCart();
    notifyListeners();
  }

  void reduceQuantityByOne(String productId) {
    _cartItems.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: productId,
        quantity: value.quantity - 1,
      ),
    );

    notifyListeners();
  }

  void increaseQuantityByOne(String productId) {
    _cartItems.update(
      productId,
      (value) => CartModel(
        id: value.id,
        productId: productId,
        quantity: value.quantity + 1,
      ),
    );
    notifyListeners();
  }

  Future<void> clearCart() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user.uid;
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'userCartItems': [],
      });
      _cartItems.clear();
      notifyListeners();
    }
  }

  // void removeOneItem(String productId) {
  //   _cartItems.remove(productId);
  //   notifyListeners();
  // }
}
