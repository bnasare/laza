import 'package:flutter/material.dart';
import 'package:laza/screens/order_confirmed_screen.dart';
import 'package:laza/screens/user/widgets/delivery_address_card.dart';
import 'package:laza/widgets/cards/shirtCard.dart';

import '../../../widgets/cards/bottom_card.dart';
import '../../../widgets/custom icons/custom_back_button.dart';
import '../widgets/payment_method_card.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
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
            Card(
              elevation: 10,
              shadowColor: Colors.white,
              child: ShirtCard(
                assetName: 'IMG',
                productName: 'Men\'s Tie-Dye T-Shirt',
                brandType: 'Nike Sportswear',
                price: '\$45(-\$4.00 Tax)',
                numItems: 1,
                cardColor: color.onPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20),
              child: ShirtCard(
                assetName: 'image',
                productName: 'Men\'s Tie-Dye T-Shirt',
                brandType: 'Nike Sportswear',
                price: '\$45(-\$4.00 Tax)',
                numItems: 1,
                cardColor: color.background,
              ),
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
                    '\$100',
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
                    '\$10',
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
                  '\$120',
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
            Navigator.pushNamed(context, OrderConfirmedScreen.routeName);
          }),
    );
  }
}