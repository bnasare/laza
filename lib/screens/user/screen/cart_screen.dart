import 'package:flutter/material.dart';
import 'package:laza/screens/user/widgets/address_card.dart';
import 'package:laza/widgets/shirtCard.dart';

import '../../../widgets/bottom_card.dart';
import '../../../widgets/custom_back_button.dart';

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
          children: [
            ShirtCard(
              assetName: 'IMG',
              productName: 'Men\'s Tie-Dye T-Shirt',
              brandType: 'Nike Sportswear',
              price: '\$45(-\$4.00 Tax)',
              numItems: 1,
              cardColor: color.onPrimary,
            ),
            const SizedBox(height: 10),
            ShirtCard(
              assetName: 'image',
              productName: 'Men\'s Tie-Dye T-Shirt',
              brandType: 'Nike Sportswear',
              price: '\$45(-\$4.00 Tax)',
              numItems: 1,
              cardColor: color.background,
            ),
            const addressCard(
              assetName: 'map',
              heading: 'Delivery Address',
              firstLine: 'Chhatak, Sunamgonj 12/8AB',
              secondLine: 'Sylhet',
            ),
            const addressCard(
              assetName: 'Frame',
              heading: 'Payment Method',
              firstLine: 'Visa Classic',
              secondLine: '**** 7690',
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Order Info',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: color.secondary),
                )),
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
      bottomNavigationBar: NavigationCard(text: 'Save Address', onTap: () {}),
    );
  }
}
