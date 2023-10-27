import 'package:flutter/material.dart';

import '../../../widgets/bottom_card.dart';
import '../widgets/custom_back_button.dart';

class OrderConfirmedScreen extends StatelessWidget {
  static const routeName = '/order_confirmed';

  const OrderConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 13.0),
          child: CustomBackButton(
            backgroundColor: color.background,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mask_group.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  right: 55, left: 55, top: 50, bottom: 30),
              height: MediaQuery.of(context).size.height / 2.8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/confirmed_screen.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Text(
              'Order Confirmed!',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 8),
              child: Text(
                'Your order has been confirmed, we will send you a confirmation email shortly.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: color.tertiary,
                  height: 1.3,
                ),
              ),
            ),
            const Spacer(),
            Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 27),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: color.background,
                    ),
                    child: Center(
                      child: Text(
                        'Go to orders',
                        style: TextStyle(fontSize: 17, color: color.tertiary),
                      ),
                    ),
                  ),
                ),
                NavigationCard(text: 'Continue Shopping', onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
