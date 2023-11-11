import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../screens/product_details_screen.dart';

class CartWidget extends StatefulWidget {
  final int quantity;
  const CartWidget({
    super.key,
    required this.quantity,
  });

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  int currentNumItems = 1;

  @override
  void initState() {
    super.initState();
    currentNumItems = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final cartModel = Provider.of<CartModel>(context);
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final getCurrProduct = productProvider.findProdById(cartModel.productId);
    final cartProvider = Provider.of<CartProvider>(context);
    double usedPrice = getCurrProduct.price;

    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.routeName,
            arguments: cartModel.productId);
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Image.asset(
                getCurrProduct.imagePath,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getCurrProduct.name,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: color.secondary),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 12),
                    child: Text(
                      '\$ ${(usedPrice * currentNumItems).toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8F959E)),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (currentNumItems > 1) {
                              cartProvider
                                  .reduceQuantityByOne(cartModel.productId);
                              setState(() {
                                currentNumItems--;
                              });
                            }
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: const Color(0xff8F959E))),
                            child: const Center(
                              child: Icon(
                                Icons.expand_more,
                                size: 18,
                                color: Color(0xff8F959E),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 3.0),
                          child: SizedBox(
                            width: 20,
                            child: Center(
                              child: Text(
                                ' $currentNumItems',
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            cartProvider
                                .increaseQuantityByOne(cartModel.productId);
                            setState(() {
                              currentNumItems++;
                            });
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: const Color(0xff8F959E))),
                            child: const Center(
                              child: Icon(
                                Icons.expand_less,
                                size: 18,
                                color: Color(0xff8F959E),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              await cartProvider
                                  .removeOneItem(cartModel.productId);
                            },
                            child: Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: const Color(0xff8F959E))),
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.trash,
                                  size: 15,
                                  color: Color(0xff8F959E),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
