import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../models/order_model.dart';
import 'cart_provider.dart';
import 'product_provider.dart';

class OrdersProvider with ChangeNotifier {
  static List<OrderModel> ordersList = [];
  List<OrderModel> get getOrders {
    return ordersList;
  }

  Future<void> placeOrder(BuildContext context) async {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    double total = 0.0;
    cartProvider.getCartItems.forEach((key, value) {
      final getCurrProduct = productProvider.findProdById(key);
      total += getCurrProduct.price * value.quantity;
    });
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        var cartItems = Map.of(cartProvider.getCartItems);
        for (var entry in cartItems.entries) {
          final orderId = const Uuid().v4();
          final product = productProvider.findProdById(entry.key);
          final price = product.price;
          final orderData = {
            'orderId': orderId,
            'userId': user.uid,
            'productId': entry.key,
            'price': price * entry.value.quantity,
            'totalPrice': total,
            'quantity': entry.value.quantity,
            'imageUrl': product.imagePath,
            'userName': user.displayName,
            'orderDate': Timestamp.now(),
          };

          await FirebaseFirestore.instance
              .collection('orders')
              .doc(orderId)
              .set(orderData);
        }

        await fetchOrders();
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        //   content: Text('Order placed successfully!'),
        // ));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error.toString()),
        ));
      }
    }
  }

  Future<void> fetchOrders() async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection('orders')
        .where('userId', isEqualTo: user!.uid)
        .orderBy('orderDate', descending: false)
        .get()
        .then((QuerySnapshot ordersSnapshot) {
      ordersList = [];
      // _orders.clear();
      for (var element in ordersSnapshot.docs) {
        ordersList.insert(
          0,
          OrderModel(
            orderId: element.get('orderId'),
            userId: element.get('userId'),
            productId: element.get('productId'),
            userName: element.get('userName'),
            price: element.get('price').toString(),
            imageUrl: element.get('imageUrl'),
            quantity: element.get('quantity').toString(),
            orderDate: element.get('orderDate'),
          ),
        );
      }
    });
    notifyListeners();
  }

  void clearOrders() async {
    ordersList.clear();
    notifyListeners();
  }
}
