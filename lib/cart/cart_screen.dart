import 'package:flutter/material.dart';
import 'package:laza/screens/user/screen/reference_screen.dart';
import 'package:laza/screens/user/widgets/delivery_address_card.dart';
import 'package:provider/provider.dart';

import '../consts/sizing_config.dart';
import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';
import '../screens/user/widgets/payment_method_card.dart';
import '../widgets/cards/bottom_card.dart';
import '../widgets/custom icons/custom_back_button.dart';
import '../widgets/empty_widget.dart';
import 'cart_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final cartProvider = Provider.of<CartProvider>(context);
    final cartItemsList =
        cartProvider.getCartItems.values.toList().reversed.toList();
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    double subtotal = 0.0;
    cartProvider.getCartItems.forEach((key, value) {
      final getCurrProduct = productProvider.findProdById(key);
      subtotal += (getCurrProduct.price) * value.quantity;
    });
    double shippingCost = 30.0;
    double total = subtotal + shippingCost;

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
                  const DeliveryAddressCard(
                    assetName: 'map',
                    label: 'Delivery Address',
                    address: 'Chhatak, Sunamgonj 12/8AB',
                    city: 'Sylhet',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0, bottom: 20),
                    child: PaymentMethodCard(
                      cardTypeImage: 'Frame',
                      label: 'Payment Method',
                      cardType: 'Visa Classic',
                      truncatedCardNo: '**** 7690',
                    ),
                  ),
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
                          '\$${subtotal.toStringAsFixed(2)}',
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
                          '\$30',
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
                onTap: () {
                  // Navigator.pushNamed(context, OrderConfirmedScreen.routeName);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PaymentReferenceScreen(amount: 200),
                    ),
                  );
                }),
          );
  }
}
