import 'package:flutter/material.dart';
import 'package:laza/screens/user/screen/user_address_screen.dart';
import 'package:laza/utils/snack_bar.dart';
import 'package:provider/provider.dart';

import '../consts/sizing_config.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../screens/user/screen/reference_screen.dart';
import '../widgets/cards/bottom_card.dart';
import '../widgets/custom icons/custom_back_button.dart';
import '../widgets/empty_widget.dart';
import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key, this.address, this.city}) : super(key: key);

  final String? city;
  final String? address;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemsList =
        cartProvider.getCartItems.values.toList().reversed.toList();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    double total = 0.0;
    cartProvider.getCartItems.forEach((key, value) {
      final getCurrProduct = productProvider.findProdById(key);
      total += (getCurrProduct.price) * value.quantity;
    });

    return cartItemsList.isEmpty
        ? const EmptyScreen(
            title: 'Oops!',
            buttonText: 'Continue Shopping',
            subtitle: "Your Cart's Feeling a Bit Lonely",
          )
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Cart',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: color.secondary),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: CustomBackButton(
                  backgroundColor: color.background,
                ),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.only(top: 0.0, bottom: 20),
                    separatorBuilder: (context, index) => SizedBox(
                      height: verticalConverter(context, 15),
                    ),
                    shrinkWrap: true,
                    controller: ScrollController(),
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: cartItemsList.length,
                    itemBuilder: (context, index) {
                      return ChangeNotifierProvider.value(
                        value: cartItemsList[index],
                        child:
                            CartWidget(quantity: cartItemsList[index].quantity),
                      );
                    },
                  ),
                  Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, UserAddressScreen.routeName);
                        },
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, UserAddressScreen.routeName);
                              },
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Delivery Address',
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.w500,
                                            color: color.secondary),
                                      ),
                                      Icon(Icons.arrow_forward_ios,
                                          size: 13, color: color.secondary),
                                    ],
                                  ),
                                  const SizedBox(height: 13),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16.0),
                                            child: Image.asset(
                                              'assets/images/map.png',
                                              height: 50,
                                              width: 50,
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8.0),
                                                child: Text(
                                                  address ??
                                                      'Chhatak, Sunamgonji 12/8AB',
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color: color.secondary),
                                                ),
                                              ),
                                              Text(
                                                city ?? 'Sylhet',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                    color: color.secondary),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 8.0),
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            color: color.onSecondary,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.check,
                                              size: 15,
                                              color: color.onPrimary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                  Text(
                    'Order Info',
                    style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: color.secondary),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: color.tertiary),
                        ),
                        Text(
                          '\$${total.toStringAsFixed(2)}',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: color.secondary),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Cost',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: color.tertiary),
                        ),
                        Text(
                          '\$0.00',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: color.secondary),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: color.tertiary),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: color.secondary),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            bottomNavigationBar: NavigationCard(
              text: 'Checkout',
              onTap: () async {
                if (city == null && address == null) {
                  print('No address selected');
                  openSnackbar(
                      context, 'Please select delivery address', Colors.red);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentReferenceScreen(amount: total),
                    ),
                  );
                }
              },
            ),
          );
  }
}
